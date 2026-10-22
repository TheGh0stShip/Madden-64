#include "types.h"

extern s32 func_800CE508(void);

s32 func_800D19F8(void) {
    *(u32*)0x80087B60 = 0x002E0003;
    return func_800CE508() & 0xFFFF;
}
