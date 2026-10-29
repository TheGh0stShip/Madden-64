#include "types.h"

extern s32 D_800E6C34;
extern s16 D_800722B4;
s16 func_800D69F0(void);

s16 func_800A848C(void) {
    D_800E6C34 = 1;
    D_800722B4 = 5;
    return func_800D69F0();
}
