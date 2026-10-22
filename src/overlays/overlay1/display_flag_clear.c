#include "types.h"

extern u32 D_80080C10;

void func_800A110C(void) {
    D_80080C10 &= ~0x400;
}
