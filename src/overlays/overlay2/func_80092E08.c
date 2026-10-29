#include "types.h"

extern u8 D_80073CF8[];
extern s32 D_80073D04[];
u8 func_8003E2C0(s32, s32);

s32 func_80092E08(u8 id) {
    s32 result = 1;
    u32 i;

    for (i = 0; i < 9; i++) {
        if (id == D_80073CF8[i]) {
            result = 0;
            if (func_8003E2C0(D_80073D04[i], 0) == 0) {
                break;
            }
            result = 1;
        }
    }
    return result;
}
