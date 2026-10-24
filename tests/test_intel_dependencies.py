import copy
import io
import json
import os
import sys
import tarfile
import unittest
import tempfile
from pathlib import Path
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "scripts"))
import intel_dependencies as cache


def member(name, kind=tarfile.REGTYPE, target=""):
    item = tarfile.TarInfo(name)
    item.type = kind
    item.linkname = target
    return item


class IntelCacheTests(unittest.TestCase):
    def test_cache_invalidates_changed_build_inputs(self):
        context = {"macos": "15.7", "sdk": "26.0", "clang": "17", "xcode": "26",
                   "prefix": "/usr/local", "arch": "x86_64", "brew_sha": "a"}
        items = [{"name": "cmake", "version": "1", "recipe": "one", "keg_only": False}]
        first = cache.stage_key("foundation", context, items)
        self.assertEqual(first, cache.stage_key("foundation", dict(context), copy.deepcopy(items)))
        for changed in (dict(context, sdk="26.1"), dict(context, clang="18"), dict(context, arch="arm64"),
                        dict(context, brew_sha="b")):
            self.assertNotEqual(first, cache.stage_key("foundation", changed, items))
        for field, value in (("version", "2"), ("recipe", "two"), ("keg_only", True)):
            changed = copy.deepcopy(items)
            changed[0][field] = value
            self.assertNotEqual(first, cache.stage_key("foundation", context, changed))

    def test_archive_rejects_paths_outside_requested_kegs(self):
        for name in ("/tmp/file", "rust/1/../../file", "rust/2/bin/rustc", "other/1/file"):
            with self.subTest(name=name), self.assertRaises(ValueError):
                cache.validate_members([member(name)], {"rust/1"})

    def test_archive_cannot_write_through_symlinks(self):
        link = member("rust/1/escape", tarfile.SYMTYPE, "/tmp")
        cache.validate_members([link], {"rust/1"})
        with self.assertRaises(ValueError):
            cache.validate_members([link, member("rust/1/escape/overwritten")], {"rust/1"})
        link.name = "./rust/1/escape"
        with self.assertRaises(ValueError):
            cache.validate_members([link, member("rust/1/escape/overwritten")], {"rust/1"})

    def test_archive_cannot_replace_a_symlink_with_a_file(self):
        with self.assertRaises(ValueError):
            cache.validate_members([member("rust/1/file", tarfile.SYMTYPE, "/tmp/file"),
                                    member("./rust/1/file")], {"rust/1"})

    def test_hard_links_must_refer_to_regular_archive_files(self):
        regular = member("rust/1/bin/rustc")
        valid = member("rust/1/bin/rustdoc", tarfile.LNKTYPE, regular.name)
        cache.validate_members([regular, valid], {"rust/1"})
        for target in ("/tmp/file", "missing", valid.name):
            with self.subTest(target=target), self.assertRaises(ValueError):
                cache.validate_members([regular, member(valid.name, tarfile.LNKTYPE, target)], {"rust/1"})

    def test_device_files_are_not_restored(self):
        with self.assertRaises(ValueError):
            cache.validate_members([member("rust/1/device", tarfile.CHRTYPE)], {"rust/1"})

    def test_normal_homebrew_symlinks_and_archive_round_trip(self):
        buffer = io.BytesIO()
        with tarfile.open(fileobj=buffer, mode="w") as stream:
            content = member("python@3.14/3.14.9/bin/python3.14")
            content.size = 6
            stream.addfile(content, io.BytesIO(b"python"))
            stream.addfile(member("python@3.14/3.14.9/bin/python3", tarfile.SYMTYPE, "python3.14"))
        buffer.seek(0)
        with tarfile.open(fileobj=buffer) as stream:
            cache.validate_members(stream.getmembers(), {"python@3.14/3.14.9"})

    def handoff(self, candidates, event="push", matched="parent"):
        plan = {"stages": {name: {"key": name + "-key"} for name in cache.STAGES}}
        with tempfile.TemporaryDirectory() as temp:
            output = Path(temp) / "output"
            environment = {"GITHUB_EVENT_NAME": event, "GITHUB_REPOSITORY": "example/tap",
                           "GITHUB_REPOSITORY_ID": "1", "GITHUB_SHA": "approved-sha",
                           "GITHUB_OUTPUT": str(output), "MATCHED_CACHE_KEY": matched}
            responses = [json.dumps({"workflow_runs": candidates}),
                         json.dumps({"artifacts": [{"name": "runtime-key", "expired": False}]})]
            with patch.dict(os.environ, environment), patch.object(cache, "load_plan", return_value=plan):
                with patch.object(cache, "run", side_effect=responses) as api:
                    cache.bootstrap()
            return output.read_text(), api.call_count

    def test_handoff_accepts_successful_same_commit_build(self):
        candidate = {"id": 2, "head_sha": "approved-sha", "conclusion": "success", "event": "push",
                     "repository": {"id": 1}, "head_repository": {"id": 1}}
        output, calls = self.handoff([candidate])
        self.assertIn("run_id=2\n", output)
        self.assertIn("cache_key=runtime-key\n", output)
        self.assertEqual(calls, 2)

    def test_handoff_rejects_other_commits_forks_and_failed_runs(self):
        candidate = {"id": 2, "head_sha": "approved-sha", "conclusion": "success", "event": "push",
                     "repository": {"id": 1}, "head_repository": {"id": 1}}
        for field, value in (("head_sha", "other"), ("conclusion", "failure"),
                             ("event", "pull_request"), ("head_repository", {"id": 99}),
                             ("repository", {"id": 99})):
            with self.subTest(field=field):
                output, calls = self.handoff([dict(candidate, **{field: value})])
                self.assertIn("run_id=\n", output)
                self.assertIn("cache_key=parent\n", output)
                self.assertEqual(calls, 1)

    def test_fork_pr_cannot_bootstrap_or_build_a_missing_cache(self):
        with self.assertRaisesRegex(RuntimeError, "maintainer"):
            self.handoff([], event="pull_request")
        output, calls = self.handoff([], event="pull_request", matched="runtime-key")
        self.assertIn("run_id=\n", output)
        self.assertEqual(calls, 0)

    def test_only_exact_stage_keys_and_run_suffixes_resume(self):
        plan = {"stages": {name: {"key": name + "-key"} for name in cache.STAGES}}
        self.assertEqual(cache.cache_rank(plan, "rust-key"), 3)
        self.assertEqual(cache.cache_rank(plan, "runtime-key-123-2"), 4)
        for name in ("runtime-key-evil", "runtime-key-123-2-extra", "other-runtime-key"):
            self.assertEqual(cache.cache_rank(plan, name), 0)

    def test_manifest_cannot_override_the_current_run_producer(self):
        with tempfile.TemporaryDirectory() as temp:
            folder = Path(temp)
            archive = folder / "kegs.tar"
            with tarfile.open(archive, mode="w") as stream:
                stream.addfile(member("rust/1/file"))
            original_sha = cache.file_digest(archive)
            items = [{"name": "rust", "version": "1"}]
            expected = {"key": "key", "formulae": items}
            plan = {"context": {}, "stages": {"rust": expected}}
            def manifest():
                (folder / "manifest.json").write_text(json.dumps({
                    "key": "key", "context": {}, "formulae": items,
                    "archive_sha256": cache.file_digest(archive)}))
            manifest()
            with patch.object(cache, "CACHE", folder), patch.object(cache, "verify_context"), \
                    patch.object(cache, "verify_recipes"), patch.dict(os.environ, {
                        "REQUIRE_PRODUCER": "true", "EXPECTED_ARCHIVE_SHA256": original_sha}):
                cache.inspect_cache(plan, "rust")
                with tarfile.open(archive, mode="w") as stream:
                    stream.addfile(member("rust/1/changed"))
                manifest()
                with self.assertRaisesRegex(ValueError, "producer"):
                    cache.inspect_cache(plan, "rust")
                with patch.dict(os.environ, {"EXPECTED_ARCHIVE_SHA256": ""}):
                    with self.assertRaisesRegex(ValueError, "missing producer"):
                        cache.inspect_cache(plan, "rust")


if __name__ == "__main__":
    unittest.main()
