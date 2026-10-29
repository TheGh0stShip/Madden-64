#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_80032F3C(s32, s32);                /* extern */

void func_800B41D4(void *arg0) {
    func_80032F3C(0, (*(s32 *)((u8 *)(arg0) + 0x10)));
    (*(s32 *)((u8 *)(arg0) + 0x10)) = 0;
}
