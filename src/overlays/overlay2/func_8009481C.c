#include "types.h"

#ifndef NULL
#define NULL 0
#endif

void *func_8002FEA4(s32 *, s32, s32);   /* extern */
extern s8 D_80071968;
extern s32 D_80094968;

void func_8009481C(s32 arg0) {
    D_80071968 = 1;
    (*(s32 *)((u8 *)(func_8002FEA4(&D_80094968, 1, 0)) + 8)) = arg0;
}
