import hashlib
import io
import json
import sys
import tarfile
import unittest
from pathlib import Path
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "scripts"))
import update_formulas as updater


def archive(*names):
    buffer = io.BytesIO()
    with tarfile.open(fileobj=buffer, mode="w:gz") as tar:
        for name in names:
            info = tarfile.TarInfo(name)
            info.size = 3
            tar.addfile(info, io.BytesIO(b"bin"))
    return buffer.getvalue()


class UpdateTests(unittest.TestCase):
    def test_archive_requires_real_binary_not_launcher(self):
        with self.assertRaises(ValueError):
            updater.validate_archive(archive("example-cli"), ["example"])
        updater.validate_archive(archive("package/example", "package/example-cli"), ["example"])

    def test_archive_rejects_ambiguous_binary(self):
        with self.assertRaises(ValueError):
            updater.validate_archive(archive("a/example", "b/example"), ["example"])

    def test_source_root_ignores_nested_fixture_manifests(self):
        updater.validate_archive(archive("example-1.2.3/Cargo.toml", "example-1.2.3/Cargo.lock",
                                         "example-1.2.3/tests/fixture/Cargo.toml"),
                                 ["example-1.2.3/Cargo.toml", "example-1.2.3/Cargo.lock"])
        with self.assertRaises(ValueError):
            updater.validate_archive(archive("wrong-root/Cargo.lock"),
                                     ["example-1.2.3/Cargo.lock"])

    @patch.object(updater, "download", return_value=b"tampered")
    def test_release_digest_must_match(self, download):
        with self.assertRaisesRegex(ValueError, "digest mismatch"):
            updater.pin("https://example.com/release", "sha256:" + "0" * 64)
        self.assertEqual(updater.pin("https://example.com/release")["sha256"],
                         hashlib.sha256(b"tampered").hexdigest())

    def test_renderer_rejects_ruby_interpolation(self):
        release = {"version": "1.2.3", "sources": {"source": {
            "url": 'https://example.com/#{system("false")}', "sha256": "0" * 64}}}
        with self.assertRaises(ValueError):
            updater.render('@SOURCE_URL@', release)

    def test_missing_architecture_fails_closed(self):
        release = {"tag_name": "v1.2.3", "draft": False, "prerelease": False, "assets": []}
        with patch.object(updater.subprocess, "check_output", return_value=json.dumps(release)):
            with self.assertRaises(KeyError):
                updater.update("example", {"kind": "native", "assets": {"mac_arm": "missing"}}, None)

    def test_downgrade_is_rejected(self):
        release = {"tag_name": "v1.2.2", "draft": False, "prerelease": False}
        with patch.object(updater.subprocess, "check_output", return_value=json.dumps(release)):
            with self.assertRaisesRegex(ValueError, "downgrade"):
                updater.update("example", {}, {"version": "1.2.3"})

    def test_unchanged_release_needs_no_download(self):
        previous = {"version": "1.2.3", "sources": {}}
        release = {"tag_name": "v1.2.3", "draft": False, "prerelease": False}
        with patch.object(updater.subprocess, "check_output", return_value=json.dumps(release)):
            with patch.object(updater, "download") as download:
                self.assertEqual(updater.update("example", {}, previous), previous)
                download.assert_not_called()


if __name__ == "__main__":
    unittest.main()
