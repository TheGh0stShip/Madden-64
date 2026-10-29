#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_800E234C(s16, s16);                        /* extern */
extern s16 D_80084F6C;

s32 func_800AD984(s16 arg0) {
    return func_800E234C(D_80084F6C, arg0) & 0xFFFF;
}
