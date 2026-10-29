#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_80016FE4(s32);                         /* extern */
extern u8 D_80071C50;
extern s32 D_80086CC8[];
extern s32 D_80087130;

s32 func_80094A20(s32 arg0) {
    s32 var_a0;
    u8 temp_v0;

    if (arg0 == 0x1D) {
        var_a0 = D_80087130;
        goto block_6;
    }
    if (arg0 == 5) {
        temp_v0 = D_80071C50 + 1;
        D_80071C50 = temp_v0;
        if ((u32) (temp_v0 & 0xFF) >= 5U) {
            D_80071C50 = 1;
        }
        var_a0 = D_80086CC8[D_80071C50];
block_6:
        func_80016FE4(var_a0);
    }
    return D_80087130;
}
