#!/usr/bin/env python3
"""Pin published releases and render the formulas managed by this tap.

No release is created here: upstream projects publish with vership. Update all
managed formulas with no arguments, or pass project names. --check is offline.
"""
import argparse
import hashlib
import io
import json
import re
import subprocess
import tarfile
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent


def download(url):
    request = urllib.request.Request(url, headers={"User-Agent": "homebrew-formula-updater"})
    with urllib.request.urlopen(request, timeout=120) as response:
        return response.read()


def validate_archive(data, required):
    with tarfile.open(fileobj=io.BytesIO(data), mode="r:gz") as archive:
        for name in required:
            matches = [m for m in archive.getmembers() if (m.name == name if "/" in name else Path(m.name).name == name) and m.isfile()]
            if len(matches) != 1 or matches[0].size == 0:
                raise ValueError(f"archive must contain exactly one nonempty regular file: {name}")


def pin(url, digest=None, required=()):
    data = download(url)
    actual = hashlib.sha256(data).hexdigest()
    if digest and digest != f"sha256:{actual}":
        raise ValueError(f"release digest mismatch: {url}")
    if required:
        validate_archive(data, required)
    return {"url": url, "sha256": actual}


def render(template, release):
    values = {"VERSION": release["version"]}
    if not re.fullmatch(r"\d+\.\d+\.\d+", values["VERSION"]):
        raise ValueError("expected a stable semantic version")
    revision = release.get("revision", 0)
    if type(revision) is not int or revision < 0:
        raise ValueError("expected a nonnegative integer formula revision")
    values["REVISION"] = f"\n  revision {revision}" if revision else ""
    for key, source in release["sources"].items():
        if not re.fullmatch(r"[a-f0-9]{64}", source["sha256"]):
            raise ValueError(f"invalid checksum: {key}")
        if not source["url"].startswith("https://") or any(c in source["url"] for c in '"\\\n\r#'):
            raise ValueError(f"unsafe source URL: {key}")
        for field in ("url", "sha256"):
            values[f"{key}_{field}".upper()] = source[field]
    def replace(match):
        return values[match[1]]
    return re.sub(r"@([A-Z_0-9]+)@", replace, template)


def update(name, project, previous, refresh=False):
    release = json.loads(subprocess.check_output(
        ["gh", "api", f"repos/rvben/{name}/releases/latest"], text=True))
    if release["draft"] or release["prerelease"]:
        raise ValueError(f"not a stable release: {name}")
    version = release["tag_name"].removeprefix("v")
    if not re.fullmatch(r"\d+\.\d+\.\d+", version):
        raise ValueError(f"invalid release tag: {name}")
    if previous and tuple(map(int, version.split("."))) < tuple(map(int, previous["version"].split("."))):
        raise ValueError(f"refusing to downgrade {name}")
    if previous and previous["version"] == version and not refresh:
        return previous
    sources = {}
    if project["kind"] in {"native", "hybrid"}:
        assets = {a["name"]: a for a in release["assets"]}
        for platform, pattern in project["assets"].items():
            asset = assets[pattern.format(version=version)]  # fail closed on missing assets
            expected = f"https://github.com/rvben/{name}/releases/download/{release['tag_name']}/{asset['name']}"
            if asset["browser_download_url"] != expected:
                raise ValueError(f"unexpected asset URL: {name}")
            sources[platform] = pin(expected, asset.get("digest"),
                                    [project["binary"]] if expected.endswith(".tar.gz") else ())
        if project["kind"] == "hybrid":
            sources["linux_source"] = pin(f"https://static.crates.io/crates/{name}/{name}-{version}.crate",
                                          required=[f"{name}-{version}/Cargo.toml", f"{name}-{version}/Cargo.lock"])
    elif project["kind"] == "crate":
        sources["source"] = pin(f"https://static.crates.io/crates/{name}/{name}-{version}.crate",
                                required=[f"{name}-{version}/Cargo.toml", f"{name}-{version}/Cargo.lock"])
    elif project["kind"] == "source":
        sources["source"] = pin(f"https://github.com/rvben/{name}/archive/refs/tags/{release['tag_name']}.tar.gz",
                                required=[f"{name}-{version}/{path}" for path in project["required"]])
    elif project["kind"] == "pypi":
        metadata = json.loads(download(f"https://pypi.org/pypi/{name}/{version}/json"))
        sdist = next(u for u in metadata["urls"] if u["packagetype"] == "sdist")
        sources["source"] = pin(sdist["url"], "sha256:" + sdist["digests"]["sha256"])
    else:
        raise ValueError(f"unsupported package kind: {project['kind']}")
    pinned = {"version": version, "sources": sources}
    # Re-pinning a recipe must not downgrade its packaging revision. A new
    # upstream version starts at revision zero unless a maintainer changes it.
    if previous and previous["version"] == version and "revision" in previous:
        pinned["revision"] = previous["revision"]
    return pinned


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("names", nargs="*")
    parser.add_argument("--check", action="store_true", help="verify committed formulas without network")
    parser.add_argument("--refresh", action="store_true", help="re-pin assets even when the release version is unchanged")
    args = parser.parse_args()
    if args.check and args.refresh:
        parser.error("--check and --refresh are mutually exclusive")
    projects = json.loads((ROOT / "packaging/projects.json").read_text())
    lock_path = ROOT / "packaging/versions.json"
    versions = json.loads(lock_path.read_text())
    names = args.names or list(projects)
    for name in names:
        if name not in projects:
            parser.error(f"unknown managed project: {name}")
    if not args.check:
        # Fetch everything before writing, so missing assets cannot leave a partial update.
        for name in names:
            versions[name] = update(name, projects[name], versions.get(name), refresh=args.refresh)
    rendered = {name: render((ROOT / f"packaging/{name}.rb.in").read_text(), versions[name]) for name in names}
    if args.check:
        stale = [name for name, content in rendered.items() if (ROOT / f"Formula/{name}.rb").read_text() != content]
        if stale:
            parser.error("formulas differ from pinned releases: " + ", ".join(stale))
    else:
        for name, content in rendered.items():
            (ROOT / f"Formula/{name}.rb").write_text(content)
        lock_path.write_text(json.dumps(versions, indent=2) + "\n")


if __name__ == "__main__":
    main()
