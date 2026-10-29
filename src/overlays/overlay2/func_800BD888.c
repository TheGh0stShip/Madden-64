#include "types.h"

#ifndef NULL
#define NULL 0
#endif

extern s16 D_80073D6A;
extern u16 D_800C5098;
extern s8 D_800C509C;

s32 func_800BD888(void) {
    s32 var_a0;

    var_a0 = 0;
    if ((D_800C5098 == 0xA55A) && (D_80073D6A == 1)) {
        var_a0 = D_800C509C >= 6;
    }
    return var_a0;
}
