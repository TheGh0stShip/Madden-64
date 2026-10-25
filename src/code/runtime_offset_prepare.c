#include "types.h"

extern void* D_80071310;

void func_8002E9E8(s32 offset) {
    volatile u16 values[4];

    if (D_80071310 != 0) {
        values[0] = ((u32)offset >> 16) * 8 + 0x3D0;
        values[1] = 0;
        values[2] = 8;
        values[3] = 8;
    }
}
