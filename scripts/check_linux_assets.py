#!/usr/bin/env python3
"""Run pinned Linux release binaries on the CI host (Debian 12 for the ABI floor)."""
import argparse
import hashlib
import io
import json
import os
import platform
import subprocess
import tarfile
import tempfile
from pathlib import Path

from update_formulas import ROOT, download


ALLOWED_LIBRARIES = {
    "linux-vdso.so.1", "linux-gate.so.1", "ld-linux-x86-64.so.2", "ld-linux-aarch64.so.1",
    "libc.so.6", "libm.so.6", "libpthread.so.0", "libdl.so.2", "librt.so.1",
    "libgcc_s.so.1", "libresolv.so.2", "libutil.so.1",
}


def check_libraries(binary):
    result = subprocess.run(["ldd", str(binary)], text=True, capture_output=True)
    output = result.stdout + result.stderr
    if "not a dynamic executable" in output or "statically linked" in output:
        return
    if result.returncode or "not found" in output:
        raise ValueError(f"unresolved dynamic libraries for {binary.name}: {output}")
    libraries = {Path(line.split()[0]).name for line in output.splitlines() if line.strip()}
    unexpected = libraries - ALLOWED_LIBRARIES
    if unexpected:
        raise ValueError(f"undeclared runtime libraries for {binary.name}: {sorted(unexpected)}")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--assets", type=Path, help="use existing release downloads instead of the network")
    args = parser.parse_args()
    architecture = {"x86_64": "linux_intel", "aarch64": "linux_arm"}[platform.machine()]
    projects = json.loads((ROOT / "packaging/projects.json").read_text())
    releases = json.loads((ROOT / "packaging/versions.json").read_text())
    for name, project in projects.items():
        if project["kind"] != "native":
            continue
        source = releases[name]["sources"][architecture]
        data = ((args.assets / name / source["url"].rsplit("/", 1)[1]).read_bytes()
                if args.assets else download(source["url"]))
        if hashlib.sha256(data).hexdigest() != source["sha256"]:
            raise ValueError(f"checksum mismatch: {name}")
        with tempfile.TemporaryDirectory(prefix="linux-asset-") as temp:
            root = Path(temp)
            binary = root / project["binary"]
            with tarfile.open(fileobj=io.BytesIO(data), mode="r:gz") as archive:
                matches = [m for m in archive.getmembers()
                           if Path(m.name).name == binary.name and m.isfile()]
                if len(matches) != 1:
                    raise ValueError(f"ambiguous or missing binary: {name}")
                binary.write_bytes(archive.extractfile(matches[0]).read())
            binary.chmod(0o755)
            check_libraries(binary)
            env = dict(os.environ, HOME=temp, XDG_CONFIG_HOME=str(root / "config"))
            subprocess.run([str(binary), "--version"], check=True, cwd=root, env=env)
            subprocess.run([str(binary), "--help"], check=True, cwd=root, env=env,
                           stdout=subprocess.DEVNULL)
            print(f"PASS: {name} ({architecture})", flush=True)


if __name__ == "__main__":
    main()
