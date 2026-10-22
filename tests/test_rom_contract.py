import importlib.util
import unittest
from pathlib import Path


class RomContractTests(unittest.TestCase):
    def test_constants_are_canonical_widths(self):
        path = Path(__file__).parents[1] / "tools" / "verify_rom.py"
        spec = importlib.util.spec_from_file_location("verify_rom", path)
        module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(module)
        self.assertEqual(module.SIZE, 0xC00000)
        self.assertEqual(len(module.SHA1), 40)
        self.assertEqual(len(module.SHA256), 64)


if __name__ == "__main__":
    unittest.main()
