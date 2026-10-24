#include "types.h"

extern u8 D_800886E7[];

void func_800DDEA4(void) {
    s32 outer;
    register s32 inner __asm__("$4");

    outer = 1;
    for (inner = 1; inner < 6; inner++) {
        D_800886E7[inner] = inner;
    }
    while (outer == 1) {
        outer = 0;
        for (inner = 3; inner >= 0; inner--) {
        }
    }
}
