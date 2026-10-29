#include "types.h"

#ifndef NULL
#define NULL 0
#endif

void *func_8002FEA4(s32 *, s32, s32);   /* extern */
extern s8 D_80071968;
extern s32 D_800949C0;

void func_80094864(s32 arg0) {
    D_80071968 = 1;
    (*(s32 *)((u8 *)(func_8002FEA4(&D_800949C0, 1, 0)) + 8)) = arg0;
}
