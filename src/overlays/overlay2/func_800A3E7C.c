#include "types.h"

extern s32 D_800E6C28;
extern s16 D_800721F0;
s16 func_800D6978(void);

s16 func_800A3E7C(void) {
    D_800E6C28 = 1;
    D_800721F0 = 5;
    return func_800D6978();
}
