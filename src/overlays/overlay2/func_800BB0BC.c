#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_80016B70(s32, s32);                    /* extern */

void func_800BB0BC(s32 arg0, void *arg1) {
    (*(s8 *)((u8 *)(arg1) + 0xC)) = (s8) (func_80016B70(0, arg0 & 0xFF) + 1);
}
