#include "types.h"

extern s32 D_80080C10;

s32 func_800A6580(void);

s32 func_800C220C(void) {
    s32 kind = (u8) func_800A6580();

    if ((kind == 7) && (D_80080C10 & 0x4000)) {
        return 0;
    }
    return 1;
}
