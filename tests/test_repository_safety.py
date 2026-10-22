from pathlib import Path
import subprocess
import unittest


ROOT = Path(__file__).resolve().parents[1]


def git_command(*args: str) -> list[str]:
    private_dir = ROOT / ".git-data"
    if private_dir.is_dir():
        return ["git", f"--git-dir={private_dir}", f"--work-tree={ROOT}", *args]
    return ["git", *args]


class RepositorySafetyTests(unittest.TestCase):
    def test_private_instruction_file_is_ignored(self) -> None:
        name = "AG" + "ENTS.md"
        result = subprocess.run(
            git_command("check-ignore", "-q", name), cwd=ROOT, check=False
        )
        self.assertEqual(result.returncode, 0)

    def test_tracked_files_contain_no_assistant_metadata(self) -> None:
        blocked = (
            "ch" + "atgpt",
            "cl" + "aude",
            "anth" + "ropic",
            "co" + "dex",
            "l" + "lm",
        )
        tracked = subprocess.run(
            git_command("ls-files", "-z"), cwd=ROOT, check=True, capture_output=True
        ).stdout.split(b"\0")
        violations = []
        for raw_name in tracked:
            if not raw_name:
                continue
            path = ROOT / raw_name.decode()
            lowered_name = path.name.lower()
            if lowered_name == ("ag" + "ents.md").lower():
                violations.append(str(path.relative_to(ROOT)))
                continue
            try:
                text = path.read_text(encoding="utf-8").lower()
            except (UnicodeDecodeError, OSError):
                continue
            if any(word in text for word in blocked):
                violations.append(str(path.relative_to(ROOT)))
        self.assertEqual(violations, [])


if __name__ == "__main__":
    unittest.main()
