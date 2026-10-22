import importlib.util
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location(
    "rank_overlay_candidates", ROOT / "tools/rank_overlay_candidates.py"
)
RANK = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = RANK
SPEC.loader.exec_module(RANK)


class RankOverlayCandidatesTests(unittest.TestCase):
    def test_ranked_candidates_are_unmatched_and_not_rejected(self):
        for module in RANK.MODULES:
            matched = RANK.matched_ranges(module.manifest)
            rejected = RANK.rejected_starts(module.findings)
            rows = RANK.rank_module(module)
            self.assertTrue(rows)
            self.assertTrue(all(not any(start <= row["rom"] and
                                        row["rom"] + row["size"] <= end
                                        for start, end in matched)
                                for row in rows))
            self.assertTrue(all(row["vram"] not in rejected for row in rows))
            self.assertEqual(rows, sorted(rows,
                             key=lambda row: (row["size"], row["vram"])))

    def test_known_false_starts_are_excluded(self):
        rows = RANK.ranked_candidates(0x1000)
        addresses = {row["vram"] for row in rows}
        self.assertNotIn(0x80090678, addresses)
        self.assertNotIn(0x80097120, addresses)
        self.assertNotIn(0x800A1AA4, addresses)
        self.assertNotIn(0x800B7A50, addresses)
        self.assertNotIn(0x800944D0, addresses)
        self.assertNotIn(0x800C77E8, addresses)
        self.assertNotIn(0x800C78A4, addresses)

    def test_fallthrough_after_call_is_not_a_function_start(self):
        image = (ROOT / "build/us/audit/overlay_1.z64").read_bytes()
        self.assertFalse(RANK.has_closed_predecessor(image, 0x811C))
        self.assertTrue(RANK.uses_saved_context(image, 0x12AA0, 8))
        self.assertFalse(RANK.has_complete_exit(image, 0x28A4C, 8))


if __name__ == "__main__":
    unittest.main()
