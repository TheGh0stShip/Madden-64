#include "types.h"

#ifndef NULL
#define NULL 0
#endif

extern s32 D_8006B8B0[];

void func_800ACBA0(s32 arg0) {
    s32 var_a1;
    u16 *temp_v0;
    u16 temp_v1;

    var_a1 = 0;
    do {
        temp_v0 = ((var_a1 & 0xFFFF) * 2) + D_8006B8B0[arg0];
        temp_v1 = *temp_v0;
        if (temp_v1 == 0x1F) {
            *temp_v0 = 0xFFFF;
        } else if (temp_v1 == 0xFFFF) {
            *temp_v0 = 0x1F;
        }
        var_a1 += 1;
    } while ((u32) (var_a1 & 0xFFFF) < 8U);
}
