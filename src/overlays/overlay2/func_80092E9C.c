#include "types.h"

#ifndef NULL
#define NULL 0
#endif

extern u16 D_800C5098;

s32 func_80092E9C(void) {
    return D_800C5098 == 0xA55A;
}
