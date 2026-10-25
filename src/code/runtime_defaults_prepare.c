#include "types.h"

extern void* D_80071310;

void func_8002EA24(void) {
    volatile u16 values[4];

    if (D_80071310 != 0) {
        values[0] = 0x3D0;
        values[1] = 8;
        values[2] = 0x28;
        values[3] = 8;
    }
}
