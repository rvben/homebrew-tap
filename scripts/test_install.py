#!/usr/bin/env python3
"""Install and test managed formulas in an isolated tap; preserve existing installs."""
import argparse
import json
import os
import shutil
import subprocess
import tempfile
import uuid
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("names", nargs="*")
    args = parser.parse_args()
    projects = json.loads((ROOT / "packaging/projects.json").read_text())
    names = args.names or list(projects)
    if any(name not in projects for name in names):
        parser.error("unknown managed formula")
    env = dict(os.environ, HOMEBREW_NO_AUTO_UPDATE="1", HOMEBREW_NO_INSTALL_CLEANUP="1",
               HOMEBREW_NO_AUTOREMOVE="1", HOMEBREW_NO_ANALYTICS="1")
    def brew(*arguments, **kwargs):
        return subprocess.run(["brew", *arguments], env=env, check=True, **kwargs)
    def installed():
        output = brew("list", "--formula", "--versions", capture_output=True, text=True).stdout
        return {line.split()[0] for line in output.splitlines() if line.strip()}
    conflicts = set(names) & installed()
    if conflicts:
        parser.error("refusing to replace existing installations: " + ", ".join(sorted(conflicts)))
    tap = f"local/smoke-{uuid.uuid4().hex[:12]}"
    failures = []
    with tempfile.TemporaryDirectory(prefix="tap-homebrew-") as temp:
        env["XDG_CONFIG_HOME"] = str(Path(temp) / "config")
        brew("tap-new", "--no-git", tap)
        try:
            if subprocess.run(["brew", "help", "trust"], env=env, capture_output=True).returncode == 0:
                brew("trust", tap)
            path = Path(brew("--repository", tap, capture_output=True, text=True).stdout.strip())
            for name in names:
                shutil.copyfile(ROOT / f"Formula/{name}.rb", path / f"Formula/{name}.rb")
            for name in names:
                full_name = f"{tap}/{name}"
                try:
                    brew("install", "--formula", "--build-from-source", "--skip-link", full_name)
                    brew("test", "--force", full_name)
                    print(f"PASS: {name}", flush=True)
                except subprocess.CalledProcessError as error:
                    failures.append(f"{name}: {error}")
                finally:
                    # No autoremove: dependencies may predate this test or be used elsewhere.
                    if name in installed():
                        try:
                            brew("uninstall", "--force", full_name)
                        except subprocess.CalledProcessError as error:
                            failures.append(f"{name} cleanup: {error}")
        finally:
            try:
                brew("untap", tap)
            except subprocess.CalledProcessError as error:
                failures.append(f"tap cleanup: {error}")
    if failures:
        raise SystemExit("\n".join(failures))


if __name__ == "__main__":
    main()
