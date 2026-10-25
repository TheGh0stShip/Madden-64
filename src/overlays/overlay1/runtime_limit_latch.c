#include "types.h"

extern s16 D_8008616A;
extern s16 D_80087758;
extern u32 D_80080C10;

void runtime_limit_latch(void)
{
    s16 value = D_8008616A;

    if (value != 1000) {
        D_80087758 = value;
        D_8008616A = 1000;
    }
    D_80080C10 |= 0x400;
}
