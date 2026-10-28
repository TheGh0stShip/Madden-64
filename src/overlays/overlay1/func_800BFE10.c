#include "types.h"

extern s32 D_80080C10;

u16 func_800BB644(void);

s32 func_800BFE10(void) {
    if (D_80080C10 & 0x4000) {
        return func_800BB644();
    }
    return 0;
}
