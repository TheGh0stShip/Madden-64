#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s16 func_800D69A0();                                /* extern */
extern s16 D_80072214;
extern s32 D_800E6C2C;

s16 func_800B38E8(void) {
    D_800E6C2C = 1;
    D_80072214 = 5;
    return func_800D69A0();
}
