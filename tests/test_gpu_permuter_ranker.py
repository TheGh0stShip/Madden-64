import importlib.util
import unittest
from pathlib import Path


SPEC = importlib.util.spec_from_file_location(
    "gpu_permuter_ranker", Path(__file__).parents[1] / "tools" / "gpu_permuter_ranker.py")
RANKER = importlib.util.module_from_spec(SPEC)
assert SPEC.loader is not None
SPEC.loader.exec_module(RANKER)


class GpuPermuterRankerTests(unittest.TestCase):
    def test_feature_hashing_is_stable(self):
        row = {"function": "demo", "source": "int x = a + b;", "mutations": ["commute"],
               "parent_score": 7}
        self.assertEqual(RANKER.features(row), RANKER.features(dict(row)))

    def test_multi_seed_validation_holds_out_whole_seed(self):
        rows = [
            {"function": "demo", "seed": seed, "iteration": iteration}
            for seed in (10, 20, 30) for iteration in range(4)
        ]
        train, valid = RANKER.split_rows(rows)
        self.assertEqual({row["seed"] for row in valid}, {30})
        self.assertEqual({row["seed"] for row in train}, {10, 20})

    def test_single_seed_validation_uses_temporal_tail(self):
        rows = [{"function": "demo", "seed": 10, "iteration": i} for i in range(10)]
        train, valid = RANKER.split_rows(rows)
        self.assertEqual([row["iteration"] for row in train], list(range(8)))
        self.assertEqual([row["iteration"] for row in valid], [8, 9])

    def test_multi_function_validation_holds_out_complete_functions(self):
        rows = [
            {"function": f"demo_{function}", "seed": seed, "iteration": iteration}
            for function in range(10) for seed in (10, 20) for iteration in range(4)
        ]
        train, valid = RANKER.split_rows(rows)
        train_functions = {row["function"] for row in train}
        valid_functions = {row["function"] for row in valid}
        self.assertTrue(train_functions.isdisjoint(valid_functions))
        self.assertEqual(len(valid_functions), 2)

    def test_exact_function_identity_is_not_a_feature(self):
        base = {"source": "for (;;) { call(); }", "mutations": ["commute"],
                "parent_score": 7, "parent_mismatch_counts": {"register": 2}}
        left = dict(base, function="first")
        right = dict(base, function="second")
        self.assertEqual(RANKER.features(left), RANKER.features(right))
        self.assertEqual(RANKER.structural_family(left), "loop+calls")
        self.assertEqual(RANKER.diff_signature(left), "register:2")

    def test_exploration_is_fraction_of_compile_budget(self):
        rows = [{"id": str(i), "model_priority": float(i)} for i in range(1000)]
        ordered, exploration = RANKER.select_rows(rows, 0.1, 7, 100)
        selected = ordered[:100]
        self.assertEqual(exploration, 10)
        self.assertEqual(sum(row["selection_arm"] == "random" for row in selected), 10)
        self.assertEqual(sum(row["selection_arm"] == "model" for row in selected), 90)

    def test_parent_residual_changes_features(self):
        base = {"function": "demo", "source": "int x = a + b;",
                "mutations": ["swap-stmt"], "parent_score": 2}
        register = dict(base, parent_mismatch_counts={"register": 1})
        ordering = dict(base, parent_mismatch_counts={"ordering": 1})
        self.assertNotEqual(RANKER.features(register), RANKER.features(ordering))

    def test_source_digest_ignores_line_endings_and_trailing_blank_lines(self):
        unix = {"source": "int f(void) {\n    return 1;\n}\n"}
        windows = {"source": "int f(void) {\r\n    return 1;\r\n}\r\n\r\n"}
        self.assertEqual(RANKER.source_digest(unix), RANKER.source_digest(windows))

    @unittest.skipUnless(importlib.util.find_spec("torch"), "PyTorch runs on Desktop")
    def test_structural_scores_keep_exact_separate_from_relaxed_scores(self):
        target = bytes.fromhex("0085102103e00008")
        register_near_miss = bytes.fromhex("0086102103e00008")
        scores = RANKER.structural_scores(
            target, [target, register_near_miss, target + b"\0\0\0\0"], device="cpu")
        self.assertTrue(scores[0]["exact"])
        self.assertEqual(scores[0]["word_mismatches"], 0)
        self.assertFalse(scores[1]["exact"])
        self.assertEqual(scores[1]["opcode_funct_mismatches"], 0)
        self.assertGreater(scores[1]["register_mismatches"], 0)
        self.assertFalse(scores[2]["exact"])
        self.assertEqual(scores[2]["size_delta"], 4)

    @unittest.skipUnless(importlib.util.find_spec("torch"), "PyTorch runs on Desktop")
    def test_structural_scores_detect_a_small_instruction_shift(self):
        target = bytes.fromhex("240200012403000203e00008")
        shifted = bytes.fromhex("000000002402000124030002")
        score = RANKER.structural_scores(target, [shifted], device="cpu")[0]
        self.assertLess(score["best_local_shift_mismatches"], score["word_mismatches"])


if __name__ == "__main__":
    unittest.main()
