#include "types.h"

#ifndef NULL
#define NULL 0
#endif

extern void *D_800895EC;

void func_800B9C38(s32 arg0) {
    (*(s32 *)((u8 *)((((arg0 & 0xFFFF) * 4) + 0x80080000)) + 0x7784)) = (s32) (*(s32 *)((u8 *)((((*(u8 *)((u8 *)(D_800895EC) + 0x4B)) * 4) + 0x80070000)) + -0x2AA0));
}
