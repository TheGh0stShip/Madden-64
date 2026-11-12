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

    def test_exploration_is_fraction_of_compile_budget(self):
        rows = [{"id": str(i), "model_priority": float(i)} for i in range(1000)]
        ordered, exploration = RANKER.select_rows(rows, 0.1, 7, 100)
        selected = ordered[:100]
        self.assertEqual(exploration, 10)
        self.assertEqual(sum(row["selection_arm"] == "random" for row in selected), 10)
        self.assertEqual(sum(row["selection_arm"] == "model" for row in selected), 90)


if __name__ == "__main__":
    unittest.main()
