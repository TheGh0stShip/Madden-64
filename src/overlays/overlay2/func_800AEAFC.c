#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_800DB44C(s32, s32 *, s32 *, s32 *); /* extern */

void func_800AEAFC(void *arg0) {
    s32 sp18;
    s32 sp14;
    s32 sp10;
    void *temp_s0;

    temp_s0 = (*(void **)((u8 *)(arg0) + 0x60));
    func_800DB44C((*(s32 *)((u8 *)((*(void **)((u8 *)(arg0) + 0x24))) + 0xC)), &sp10, &sp14, &sp18);
    (*(s16 *)((u8 *)((((*(u8 *)((u8 *)(temp_s0) + 0x14)) * 2) + temp_s0)) + 8)) = (s16) sp14;
}
