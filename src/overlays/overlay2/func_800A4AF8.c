#include "types.h"

extern u8 D_80073510[];
extern s32 D_800C2EB0[];

u8 func_8003E2C0(s32, s32);

s32 func_800A4AF8(u32 slot) {
    s32 ok = 1;
    u32 i;

    slot %= 41;
    if (slot >= 30) {
        for (i = 0; i < 9; i++) {
            if (slot == D_80073510[i] && func_8003E2C0(D_800C2EB0[i], 0) != 1) {
                ok = 0;
                break;
            }
        }
    }
    return ok;
}
