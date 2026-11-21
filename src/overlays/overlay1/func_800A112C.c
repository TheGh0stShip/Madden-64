#include "types.h"

extern u16 D_8008A5B2;
extern u8 *D_80086178;
extern u32 D_80084F34;
extern s16 D_800857F0;
extern u32 D_800854A4;

s32 func_800A112C(void) {
    s32 result = 0;
    u32 a = D_8008A5B2;
    u32 b = 1;

    if (a == b) {
        b = (u32)D_80086178;
        b = *(u32 *)(b + 0x20);
        a = D_80084F34;
        if (a == b) {
            b = D_800857F0;
            if (b == 0) {
                result = D_800854A4 == 0;
            }
        }
    }
    return result;
}
