#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_80022B3C(s32, u16, s32);           /* extern */

void func_800AF050(void *arg0) {
    s32 temp_v0;
    s32 temp_v0_3;
    u16 temp_v0_2;

    temp_v0 = func_80022B3C(0, (*(u16 *)((u8 *)(arg0) + 8)), 0x13);
    temp_v0_2 = (*(u16 *)((u8 *)(arg0) + 0xC)) - temp_v0;
    (*(u16 *)((u8 *)(arg0) + 0x10)) = temp_v0_2;
    if ((*(s32 *)((u8 *)(arg0) + 0)) != 0) {
        temp_v0_3 = func_80022B3C(1, (*(u16 *)((u8 *)(arg0) + 0xA)), 0x13);
        (*(u16 *)((u8 *)(arg0) + 0x10)) = (u16) ((*(u16 *)((u8 *)(arg0) + 0x10)) + temp_v0_3);
        (*(s16 *)((u8 *)(arg0) + 0x12)) = (s16) (temp_v0 + ((*(u16 *)((u8 *)(arg0) + 0xE)) - temp_v0_3));
        return;
    }
    (*(u16 *)((u8 *)(arg0) + 0x10)) = (u16) (temp_v0_2 + temp_v0);
}
