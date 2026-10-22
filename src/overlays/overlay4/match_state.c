#include "types.h"

extern u16 D_800717F2;
extern s16 D_8007A1D8;

u16 func_800E26C4(void) {
    return D_800717F2;
}

void func_800E26D4(s16 value) {
    D_8007A1D8 = value;
}
