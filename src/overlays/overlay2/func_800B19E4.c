#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_800DB44C(s32, s32 *, s32 *, s32 *); /* extern */

s32 func_800B19E4(s32 arg0, s32 arg1) {
    s32 sp18;
    s32 sp14;
    s32 sp10;

    func_800DB44C((*(s32 *)((u8 *)((*(void **)((u8 *)(((arg1 * 4) + arg0)) + 0x24))) + 0xC)), &sp10, &sp14, &sp18);
    return sp14;
}
