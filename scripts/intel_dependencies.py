#!/usr/bin/env python3
"""Build and reuse real Homebrew dependencies on the Intel macOS CI runner."""
import argparse
import hashlib
import json
import os
import platform
import re
import shutil
import subprocess
import tarfile
import tempfile
import uuid
from pathlib import Path, PurePosixPath

STAGES = ("foundation", "llvm", "rust", "runtime")
CORE_URL = "https://github.com/Homebrew/homebrew-core.git"
BREW_URL = "https://github.com/Homebrew/brew.git"
CACHE = Path.home() / "homebrew-intel-cache"
ROOT = Path(__file__).resolve().parents[1]


def run(*args):
    return subprocess.check_output(args, text=True).strip()


def checked(*args):
    subprocess.run(args, check=True)


def digest(value):
    return hashlib.sha256(json.dumps(value, sort_keys=True).encode()).hexdigest()


def file_digest(path):
    result = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            result.update(block)
    return result.hexdigest()


def context():
    return {"macos": ".".join(platform.mac_ver()[0].split(".")[:2]),
            "xcode": run("xcodebuild", "-version"),
            "clang": run("xcrun", "clang", "--version").splitlines()[0],
            "sdk": run("xcrun", "--show-sdk-version"),
            "prefix": run("brew", "--prefix"), "arch": platform.machine(),
            "brew_sha": run("git", "-C", run("brew", "--repository"), "rev-parse", "HEAD")}


def require_runner():
    if (os.environ.get("GITHUB_ACTIONS") != "true" or platform.system() != "Darwin"
            or platform.machine() != "x86_64" or run("brew", "--prefix") != "/usr/local"
            or not os.environ.get("RUNNER_TEMP") or not os.environ.get("ImageVersion")):
        raise RuntimeError("dependency mutations are restricted to the Intel macOS Actions runner")


def load_plan():
    return json.loads(os.environ["INTEL_PLAN"])


def checkout(path, url, revision):
    if not re.fullmatch(r"[0-9a-f]{40}", revision):
        raise ValueError("invalid source revision")
    if not (path / ".git").exists():
        path.mkdir(parents=True, exist_ok=True)
        checked("git", "init", str(path))
        checked("git", "-C", str(path), "remote", "add", "origin", url)
    modified = run("git", "-C", str(path), "status", "--porcelain")
    if modified:
        raise RuntimeError("refusing to replace modified Homebrew sources at "
                           + str(path) + ": " + modified[:2000])
    checked("git", "-C", str(path), "fetch", "--depth=1", url, revision)
    checked("git", "-C", str(path), "checkout", "--detach", revision)


def pin():
    require_runner()
    # setup-homebrew clears this variable when its core input is false.
    os.environ["HOMEBREW_NO_INSTALL_FROM_API"] = "1"
    if os.environ.get("GITHUB_ENV"):
        with open(os.environ["GITHUB_ENV"], "a") as stream:
            stream.write("HOMEBREW_NO_INSTALL_FROM_API=1\n")
    brew = Path(run("brew", "--repository"))
    pins = json.loads((ROOT / "packaging/intel-toolchain.json").read_text())
    if run("git", "-C", str(brew), "rev-parse", "HEAD") != pins["brew"]:
        checkout(brew, BREW_URL, pins["brew"])
    checkout(brew / "Library/Taps/homebrew/homebrew-core", CORE_URL, pins["core"])
    if os.environ.get("INTEL_PLAN"):
        verify_context(load_plan())


def deps(*names):
    return run("brew", "deps", "--include-build", "--topological", "--union", *names).splitlines()


def managed_dependencies():
    """Evaluate the actual tap formulas without changing installed formulas or trust."""
    require_runner()
    names = json.loads((ROOT / "packaging/projects.json").read_text())
    tap = "local/intel-plan-" + uuid.uuid4().hex[:12]
    previous = os.environ.get("XDG_CONFIG_HOME")
    with tempfile.TemporaryDirectory(prefix="intel-plan-") as temp:
        os.environ["XDG_CONFIG_HOME"] = str(Path(temp) / "config")
        checked("brew", "tap-new", "--no-git", tap)
        try:
            if subprocess.run(["brew", "help", "trust"], capture_output=True).returncode == 0:
                checked("brew", "trust", tap)
            target = Path(run("brew", "--repository", tap)) / "Formula"
            for name in names:
                shutil.copyfile(ROOT / "Formula" / (name + ".rb"), target / (name + ".rb"))
            qualified = [tap + "/" + name for name in names]
            return [name.removeprefix("homebrew/core/") for name in deps(*qualified)
                    if name not in qualified and name not in names]
        finally:
            try:
                checked("brew", "untap", tap)
            finally:
                if previous is None:
                    os.environ.pop("XDG_CONFIG_HOME", None)
                else:
                    os.environ["XDG_CONFIG_HOME"] = previous


def formulae(names):
    values = json.loads(run("brew", "info", "--json=v2", *names))["formulae"]
    result = {}
    for value in values:
        name = value["name"]
        if (not re.fullmatch(r"[a-z0-9][a-z0-9@+_.-]*", name)
                or value["tap"] != "homebrew/core"):
            raise ValueError("only Homebrew-core dependencies can be cached")
        version = value["versions"]["stable"]
        if value["revision"]:
            version += "_" + str(value["revision"])
        if not version or "/" in version or version in (".", ".."):
            raise ValueError("invalid keg version")
        result[name] = {"name": name, "version": version, "keg_only": value["keg_only"],
                        "recipe": value["ruby_source_checksum"]["sha256"]}
    if set(result) != set(names):
        raise ValueError("dependency formula lookup was incomplete")
    return result


def stage_key(stage, build_context, items):
    return "intel-homebrew-v1-" + stage + "-" + digest({
        "context": build_context, "formulae": sorted(items, key=lambda item: item["name"])})


def make_plan():
    base = [name for name in deps("rust") if name not in ("llvm", "rust")]
    runtime = list(dict.fromkeys(managed_dependencies()))
    groups = {"foundation": base, "llvm": base + ["llvm"],
              "rust": base + ["llvm", "rust"], "runtime": runtime}
    previous = set()
    for names in groups.values():
        if not previous.issubset(names):
            raise ValueError("dependency stages must be cumulative")
        missing = set(deps(*names)) - set(names)
        if missing:
            raise ValueError("dependency stage is not closed: " + ", ".join(sorted(missing)))
        previous = set(names)
    values = formulae(runtime)
    build_context = context()
    plan = {"context": build_context, "core_sha": run("git", "-C", run(
        "brew", "--repository", "homebrew/core"), "rev-parse", "HEAD"), "stages": {}}
    for stage, names in groups.items():
        items = [values[name] for name in names]
        plan["stages"][stage] = {"formulae": items, "key": stage_key(stage, build_context, items)}
    output = os.environ.get("GITHUB_OUTPUT")
    if output:
        with open(output, "a") as stream:
            stream.write("plan=" + json.dumps(plan, separators=(",", ":")) + "\n")
            for stage in STAGES:
                stream.write(stage + "_key=" + plan["stages"][stage]["key"] + "\n")
    path = Path(os.environ.get("RUNNER_TEMP", tempfile.gettempdir())) / "intel-plan.json"
    path.write_text(json.dumps(plan, indent=2) + "\n")
    print("Dependency plan:", ", ".join(f"{name}: {len(groups[name])} formulas" for name in STAGES))
    return plan


def verify_context(plan):
    if context() != plan["context"]:
        raise RuntimeError("cache runner/Homebrew context does not match the plan")


def verify_recipes(items):
    current = formulae([item["name"] for item in items])
    if any(current[item["name"]] != item for item in items):
        raise RuntimeError("dependency recipes changed since planning")


def installed_kegs(items, cellar):
    paths = [cellar / item["name"] / item["version"] for item in items]
    if any(not (path / "INSTALL_RECEIPT.json").is_file() for path in paths):
        raise RuntimeError("a required dependency keg is missing")
    return paths


def build(stage):
    require_runner()
    plan = load_plan()
    verify_context(plan)
    items = plan["stages"][stage]["formulae"]
    verify_recipes(items)
    previous = STAGES.index(stage) - 1
    parent = plan["stages"][STAGES[previous]]["formulae"] if previous >= 0 else []
    parent_names = {item["name"] for item in parent}
    names = [item["name"] for item in items if item["name"] not in parent_names]
    before = installed_versions()
    checked("brew", "install", "--formula", *names)
    after = installed_versions()
    unexpected = {name for name in set(before) | set(after)
                  if before.get(name) != after.get(name)} - set(names)
    if unexpected:
        raise RuntimeError("unplanned dependency changes: " + ", ".join(sorted(unexpected)))
    cellar = Path(run("brew", "--cellar"))
    kegs = installed_kegs(items, cellar)
    CACHE.mkdir(parents=True, exist_ok=True)
    archive = CACHE / "kegs.tar"
    subprocess.run(["tar", "-cf", str(archive), "-C", str(cellar),
                    *[str(path.relative_to(cellar)) for path in kegs]],
                   env=dict(os.environ, COPYFILE_DISABLE="1"), check=True)
    archive_sha = file_digest(archive)
    (CACHE / "manifest.json").write_text(json.dumps({
        "key": plan["stages"][stage]["key"], "context": plan["context"],
        "formulae": items, "archive_sha256": archive_sha}, indent=2) + "\n")
    with open(os.environ["GITHUB_OUTPUT"], "a") as stream:
        stream.write("archive_sha256=" + archive_sha + "\n")
        stream.write("cache_key=" + plan["stages"][stage]["key"] + "-"
                     + os.environ["GITHUB_RUN_ID"] + "-" + os.environ["GITHUB_RUN_ATTEMPT"] + "\n")
    print("Built and archived dependency stage:", stage, flush=True)


def validate_members(members, roots):
    entries = {str(PurePosixPath(member.name)): member for member in members}
    if len(entries) != len(members):
        raise ValueError("duplicate dependency archive path")
    links = {str(PurePosixPath(member.name)) for member in members
             if member.issym() or member.islnk()}
    for member in members:
        path = PurePosixPath(member.name)
        if (path.is_absolute() or ".." in path.parts or len(path.parts) < 2
                or "/".join(path.parts[:2]) not in roots
                or not (member.isfile() or member.isdir() or member.issym() or member.islnk())
                or any(str(parent) in links for parent in path.parents)):
            raise ValueError("unsafe dependency archive member: " + member.name)
        if member.islnk():
            target = entries.get(str(PurePosixPath(member.linkname)))
            if target is None or not target.isfile() or target.islnk():
                raise ValueError("unsafe dependency archive hard link")


def inspect_cache(plan, stage):
    verify_context(plan)
    expected = plan["stages"][stage]
    manifest = json.loads((CACHE / "manifest.json").read_text())
    if (manifest["key"] != expected["key"] or manifest["context"] != plan["context"]
            or manifest["formulae"] != expected["formulae"]):
        raise ValueError("dependency cache does not match the requested stage")
    verify_recipes(expected["formulae"])
    archive = CACHE / "kegs.tar"
    archive_sha = file_digest(archive)
    if archive_sha != manifest["archive_sha256"]:
        raise ValueError("dependency archive checksum mismatch")
    producer_sha = os.environ.get("EXPECTED_ARCHIVE_SHA256", "")
    if (os.environ.get("REQUIRE_PRODUCER") == "true"
            and not re.fullmatch(r"[0-9a-f]{64}", producer_sha)):
        raise ValueError("missing producer checksum for a fresh dependency build")
    if producer_sha and archive_sha != producer_sha:
        raise ValueError("dependency archive does not match this run's producer")
    roots = {item["name"] + "/" + item["version"] for item in expected["formulae"]}
    with tarfile.open(archive) as stream:
        validate_members(stream.getmembers(), roots)
    return expected, archive


def installed_versions():
    return {parts[0]: parts[1:] for line in run("brew", "list", "--formula", "--versions").splitlines()
            if (parts := line.split())}


def restore(stage):
    require_runner()
    plan = load_plan()
    expected, archive = inspect_cache(plan, stage)
    cellar = Path(run("brew", "--cellar"))
    for item in expected["formulae"]:
        rack = cellar / item["name"]
        if (Path(plan["context"]["prefix"]) / "var/homebrew/linked" / item["name"]).is_symlink():
            checked("brew", "unlink", item["name"])
        target = rack / item["version"]
        if target.is_symlink():
            raise ValueError("unexpected keg symlink")
        if target.exists():
            shutil.rmtree(target)
    checked("tar", "-xf", str(archive), "-C", str(cellar))
    installed_kegs(expected["formulae"], cellar)
    opt = Path(plan["context"]["prefix"]) / "opt"
    opt.mkdir(exist_ok=True)
    for item in expected["formulae"]:
        link = opt / item["name"]
        if link.is_symlink():
            link.unlink()
        link.symlink_to(cellar / item["name"] / item["version"])
        if not item["keg_only"]:
            checked("brew", "link", "--overwrite", item["name"])
    # Some hooks populate etc/ or Frameworks/ outside the cached Cellar.
    checked("brew", "postinstall", *[item["name"] for item in expected["formulae"]])
    print("Restored real Homebrew dependency stage:", stage, flush=True)


def resume():
    plan = load_plan()
    matched = os.environ.get("MATCHED_CACHE_KEY", "")
    rank = cache_rank(plan, matched)
    with open(os.environ["GITHUB_OUTPUT"], "a") as stream:
        stream.write("resume_rank=" + str(rank) + "\n")
    print("Reusable dependency stage:", STAGES[rank - 1] if rank else "none")


def cache_rank(plan, matched):
    return next((index + 1 for index, name in enumerate(STAGES)
                 if re.fullmatch(re.escape(plan["stages"][name]["key"])
                                 + r"(?:-[0-9]+-[0-9]+)?", matched)), 0)


def bootstrap():
    """Hand off a successful review build to main only when its commit is identical."""
    plan = load_plan()
    key = plan["stages"]["runtime"]["key"]
    matched = os.environ.get("MATCHED_CACHE_KEY", "")
    run_id = ""
    if os.environ["GITHUB_EVENT_NAME"] == "pull_request":
        if cache_rank(plan, matched) != 4:
            raise RuntimeError("Intel runtime cache is missing; a maintainer must run native CI first")
    elif cache_rank(plan, matched) != 4:
        repository = os.environ["GITHUB_REPOSITORY"]
        revision = os.environ["GITHUB_SHA"]
        runs = json.loads(run("gh", "api", "-X", "GET",
            "repos/" + repository + "/actions/workflows/ci.yml/runs",
            "-f", "head_sha=" + revision, "-f", "status=success", "-f", "per_page=10"))
        for candidate in runs["workflow_runs"]:
            if (candidate["head_sha"] != revision or candidate["conclusion"] != "success"
                    or candidate["event"] not in ("push", "workflow_dispatch")
                    or str(candidate["repository"]["id"]) != os.environ["GITHUB_REPOSITORY_ID"]
                    or candidate["head_repository"]["id"] != candidate["repository"]["id"]):
                continue
            artifacts = json.loads(run("gh", "api", "repos/" + repository
                + "/actions/runs/" + str(candidate["id"]) + "/artifacts"))
            if any(item["name"] == key and not item["expired"] for item in artifacts["artifacts"]):
                run_id = str(candidate["id"])
                break
    with open(os.environ["GITHUB_OUTPUT"], "a") as stream:
        stream.write("run_id=" + run_id + "\n")
        stream.write("cache_key=" + (key if run_id else matched) + "\n")
    print("Same-commit dependency handoff:", run_id or "not needed or unavailable")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("command", choices=("pin", "plan", "build", "restore", "resume", "bootstrap", "check"))
    parser.add_argument("stage", nargs="?", choices=STAGES)
    args = parser.parse_args()
    if args.command in ("build", "restore", "check"):
        if not args.stage:
            parser.error("stage is required")
        if args.command == "check":
            inspect_cache(load_plan(), args.stage)
        else:
            globals()[args.command](args.stage)
    else:
        {"pin": pin, "plan": make_plan, "resume": resume, "bootstrap": bootstrap}[args.command]()


if __name__ == "__main__":
    main()
