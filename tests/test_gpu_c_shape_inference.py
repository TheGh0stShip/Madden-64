import sys
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))

from tools.gpu_c_shape_inference import source_labels


class ShapeLabelTests(unittest.TestCase):
    def test_preprocessor_and_literals_do_not_leak_struct_dot(self):
        labels = source_labels(
            '#include "types.h"\nvoid f(void) { float x = 1.0f; }'
        )
        self.assertNotIn("memory.struct_dot", labels)

    def test_struct_field_is_detected(self):
        labels = source_labels("void f(S value) { value.field = 1; }")
        self.assertIn("memory.struct_dot", labels)

    def test_do_while_is_not_mislabeled_as_while(self):
        labels = source_labels("void f(void) { do { x++; } while (0); }")
        self.assertIn("control.do_while", labels)
        self.assertIn("control.do_while_zero", labels)
        self.assertNotIn("control.while", labels)

    def test_pointer_increment_excludes_integer_increment(self):
        self.assertNotIn("memory.pointer_increment",
                         source_labels("void f(void) { i++; }"))
        self.assertIn("memory.pointer_increment",
                      source_labels("void f(u8 *p) { x = *p++; }"))


if __name__ == "__main__":
    unittest.main()
