#include "types.h"

extern s8 D_8007A288;
extern s8 D_800C0160[];
extern u16 D_800C4B5C[][49];

s32 func_8009B3F0(s32 slot) {
    return D_800C4B5C[D_8007A288][D_800C0160[slot]] != 0xFFFF;
}
