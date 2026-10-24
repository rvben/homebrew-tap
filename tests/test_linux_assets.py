import subprocess
import sys
import unittest
from pathlib import Path
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "scripts"))
from check_linux_assets import check_libraries


class LibraryTests(unittest.TestCase):
    @patch("check_linux_assets.subprocess.run")
    def test_base_runtime_is_supported(self, run):
        run.return_value = subprocess.CompletedProcess([], 0,
            "linux-vdso.so.1 (0x1234)\nlibc.so.6 => /lib/libc.so.6 (0x5678)\n"
            "/lib64/ld-linux-x86-64.so.2 (0x1234)\n", "")
        check_libraries(Path("example"))

    @patch("check_linux_assets.subprocess.run")
    def test_undeclared_runtime_dependency_is_rejected(self, run):
        run.return_value = subprocess.CompletedProcess([], 0,
            "libssl.so.3 => /lib/libssl.so.3 (0x1234)\n", "")
        with self.assertRaisesRegex(ValueError, "undeclared runtime libraries"):
            check_libraries(Path("example"))

    @patch("check_linux_assets.subprocess.run")
    def test_new_glibc_requirement_is_rejected(self, run):
        run.return_value = subprocess.CompletedProcess([], 1, "",
            "example: /lib/libc.so.6: version `GLIBC_2.39' not found")
        with self.assertRaisesRegex(ValueError, "unresolved dynamic libraries"):
            check_libraries(Path("example"))


if __name__ == "__main__":
    unittest.main()
