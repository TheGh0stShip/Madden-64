#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s16 func_800D69C8();                                /* extern */
extern s16 D_80072274;
extern s32 D_800E6C30;

s16 func_800B38AC(void) {
    D_800E6C30 = 1;
    D_80072274 = 5;
    return func_800D69C8();
}
