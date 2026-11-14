import importlib.util
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location(
    "evaluate_precompile_ranker", ROOT / "tools/evaluate_precompile_ranker.py")
MOD = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(MOD)


def row(query, candidate, exact, model, cpu, order, function=None):
    return {
        "query_id": query, "candidate_id": candidate,
        "source_project": "fixture", "source_revision": "deadbeef",
        "source_function": function or query, "exact": exact,
        "model_score": model, "cpu_score": cpu, "original_order": order,
    }


class EvaluatePrecompileRankerTests(unittest.TestCase):
    def test_accepts_only_material_compile_savings(self):
        rows = []
        for query in range(8):
            for candidate in range(16):
                exact = candidate == 15
                rows.append(row(str(query), str(candidate), exact,
                                0 if exact else candidate + 1,
                                4 if exact else candidate,
                                candidate))
        result = MOD.evaluate(rows)
        self.assertEqual(result["metrics"]["model"]["mean_compiles_to_first_exact"], 1)
        self.assertGreaterEqual(result["speedup_over_model"]["random"], 3)
        self.assertTrue(result["accept_gpu_routing"])

    def test_rejects_ranker_that_only_beats_random(self):
        rows = [
            row("q", "exact", True, 0, 0, 4),
            row("q", "a", False, 1, 1, 0),
            row("q", "b", False, 2, 2, 1),
            row("q", "c", False, 3, 3, 2),
            row("q", "d", False, 4, 4, 3),
        ]
        result = MOD.evaluate(rows)
        self.assertFalse(result["accept_gpu_routing"])
        self.assertEqual(result["speedup_over_model"]["cpu"], 1)

    def test_rejects_mixed_query_identity_and_missing_exact(self):
        mixed = [row("q", "a", True, 0, 0, 0, "left"),
                 row("q", "b", False, 1, 1, 1, "right")]
        with self.assertRaisesRegex(ValueError, "mixes source identities"):
            MOD.evaluate(mixed)
        with self.assertRaisesRegex(ValueError, "no query contains"):
            MOD.evaluate([row("q", "a", False, 0, 0, 0)])


if __name__ == "__main__":
    unittest.main()
