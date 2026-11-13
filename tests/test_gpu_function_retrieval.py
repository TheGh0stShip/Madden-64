import importlib.util
import tempfile
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

    def test_genuine_sources_rejects_register_asm_and_specific_normalizer(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            (root / "config/us").mkdir(parents=True)
            (root / "src").mkdir()
            (root / "src/good.c").write_text("int good(void) { return 1; }\n")
            (root / "src/asm.c").write_text('register int x asm("$2");\n')
            (root / "src/rewrite.c").write_text("int rewrite(void) { return 2; }\n")
            (root / "config/us/matching_units.tsv").write_text(
                "0x0\t0x4\tsrc/good.c\t--normalizer-enable-KMC-LID-PAIR\tx\n"
                "0x4\t0x4\tsrc/asm.c\t-O2\tx\n"
                "0x8\t0x4\tsrc/rewrite.c\t--normalizer-enable-KMC-SPECIAL\tx\n")
            self.assertEqual(MODULE.genuine_sources(root), {"src/good.c"})


if __name__ == "__main__":
    unittest.main()
