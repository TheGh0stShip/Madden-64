#include "types.h"

extern s8 D_8007A288;
extern s8 D_800C0160[];
extern s8 D_800C0161[];
extern u16 D_800C4B5C[][49];

s32 func_8009AE00(s32 group) {
    s32 i;
    s32 used;

    used = 0;
    for (i = D_800C0160[group]; i < D_800C0161[group]; i++) {
        used += D_800C4B5C[D_8007A288][i] != 0xFFFF;
    }
    return used;
}
