#include "types.h"

extern s16 D_8006EAC0[];

s32 func_8002E848(u32 packed) {
    u32 index;
    s32 value;

    if (packed & 0x400) {
        index = ~packed & 0x3FF;
    } else {
        index = packed & 0x3FF;
    }
    value = D_8006EAC0[index];
    value <<= 1;
    if (packed & 0x800) {
        return -value;
    }
    return value;
}
