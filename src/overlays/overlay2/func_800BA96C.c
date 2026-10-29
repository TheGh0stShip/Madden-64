#include "types.h"

#ifndef NULL
#define NULL 0
#endif

void func_800BA96C(s32 arg0, void *arg1) {
    s32 var_a0;
    s32 var_v1;

    var_a0 = arg0;
    if ((u32) (var_a0 & 0xFFFF) < 2U) {
        var_a0 = 2;
    }
    var_v1 = (var_a0 & 0xFFFF) * 3;
    if (var_v1 < 0) {
        var_v1 += 3;
    }
    (*(s8 *)((u8 *)(arg1) + 0xF)) = (s8) ((*(u8 *)((u8 *)(arg1) + 0xB)) + (var_v1 >> 2));
}
