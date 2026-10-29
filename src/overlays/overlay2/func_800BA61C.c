#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_80016A24(s32, s32);                    /* extern */
extern s32 D_800895EC;

s32 func_800BA61C(s32 arg0) {
    s32 temp_s0;
    s32 temp_v0;
    u8 temp_s1;
    void *temp_v0_2;

    temp_s0 = arg0 & 0xFFFF;
    temp_v0_2 = D_800895EC + temp_s0;
    temp_s1 = (*(u8 *)((u8 *)(temp_v0_2) + 0x3E));
    (*(u8 *)((u8 *)(temp_v0_2) + 0x3E)) = 0U;
    temp_v0 = func_80016A24(0, D_800895EC + 0x3E) & 0xFFFF;
    (*(u8 *)((u8 *)((D_800895EC + temp_s0)) + 0x3E)) = temp_s1;
    return temp_v0;
}
