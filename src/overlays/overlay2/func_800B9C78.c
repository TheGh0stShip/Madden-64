#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_800167FC(u8);                          /* extern */
extern void *D_800895EC;

void func_800B9C78(s32 arg0, s32 arg1) {
    func_800167FC((*(u8 *)((u8 *)(D_800895EC) + 0x4C)));
    (*(s32 *)((u8 *)((((arg0 & 0xFFFF) * 4) + 0x80080000)) + 0x7784)) = arg1;
}
