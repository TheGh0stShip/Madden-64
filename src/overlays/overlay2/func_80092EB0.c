#include "types.h"

#ifndef NULL
#define NULL 0
#endif

extern u16 D_800C4EE8;

s32 func_80092EB0(void) {
    return D_800C4EE8 == 0x5AA5;
}
