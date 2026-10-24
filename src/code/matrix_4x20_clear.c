#include "types.h"

extern u32 D_8007A9C0[4][20];

void func_8004291C(void) {
    u32 row;
    u32 column;

    for (row = 0; row < 4; row++) {
        for (column = 0; column < 20; column++) {
            D_8007A9C0[row][column] = 0;
        }
    }
}
