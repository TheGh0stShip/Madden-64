#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_800A6FD4();                            /* extern */

void func_800A6FA0(void *arg0) {
    if ((u32) (*(u32 *)((u8 *)((*(void **)((u8 *)(arg0) + 0x60))) + 4)) >= 0x1A5U) {
        func_800A6FD4();
    }
}
