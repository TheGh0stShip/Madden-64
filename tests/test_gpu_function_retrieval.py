import importlib.util
import unittest
from pathlib import Path


SPEC = importlib.util.spec_from_file_location(
    "gpu_function_retrieval",
    Path(__file__).parents[1] / "tools" / "gpu_function_retrieval.py")
MODULE = importlib.util.module_from_spec(SPEC)
assert SPEC.loader is not None
SPEC.loader.exec_module(MODULE)


class GpuFunctionRetrievalTests(unittest.TestCase):
    def test_operation_distinguishes_special_functions(self):
        addu = 0x00852021
        subu = 0x00852023
        self.assertNotEqual(MODULE.operation(addu), MODULE.operation(subu))

    def test_features_are_deterministic_and_sequence_sensitive(self):
        left = bytes.fromhex("2402000103e0000800000000")
        right = bytes.fromhex("03e000082402000100000000")
        self.assertEqual(MODULE.feature_indices(left), MODULE.feature_indices(left))
        self.assertNotEqual(MODULE.feature_indices(left), MODULE.feature_indices(right))


if __name__ == "__main__":
    unittest.main()
