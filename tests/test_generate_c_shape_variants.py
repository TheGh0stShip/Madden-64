import unittest

from tools.generate_c_shape_variants import build_variants


SOURCE = '''#include "types.h"
#define M2C_FIELD(base, type, off) (*(type)((u8 *)(base) + (off)))
typedef s32 M2C_UNK;
typedef struct { s16 statistics[2][2]; } TeamData;
extern TeamData D_80081860[2];
void f(void) {
    M2C_UNK var_a0_3;
    s32 var_s5;
    register s32 temp_s2;
    void *var_v0;
    var_s5 = 0;
    temp_s2 = 0;
    var_v0 = (void *)(temp_s2 + 0x80081860);
    var_v0 = (void *)(temp_s2 + 0x80081876);
}
'''


class GenerateCShapeVariantsTests(unittest.TestCase):
    def test_generation_is_deterministic(self):
        self.assertEqual(build_variants(SOURCE, 16, 7),
                         build_variants(SOURCE, 16, 7))

    def test_matrix_contains_narrow_and_shared_base_shapes(self):
        texts = [text for _, text in build_variants(SOURCE, 16, 7)]
        self.assertTrue(any("s16 var_s5" in text for text in texts))
        self.assertTrue(any("TeamData *team_data" in text for text in texts))
        self.assertTrue(any("(u32)statistics_base" in text for text in texts))

    def test_variants_do_not_inject_assembly(self):
        for _, text in build_variants(SOURCE, 32, 11):
            self.assertNotIn("__asm__", text)
            self.assertNotIn(" asm(", text)


if __name__ == "__main__":
    unittest.main()
