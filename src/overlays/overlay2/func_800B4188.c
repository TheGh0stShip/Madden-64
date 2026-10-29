#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_80032E00(s32, s32);                /* extern */
s32 func_800BD6D0(u8, s32);                    /* extern */

void func_800B4188(void *arg0, u8 arg1) {
    s32 temp_v0;

    temp_v0 = func_80032E00(0, 0x19);
    (*(s32 *)((u8 *)(arg0) + 0x10)) = temp_v0;
    func_800BD6D0(arg1, temp_v0);
}
