#include "types.h"

extern u16 D_8008A5B2;
extern u8* D_80086178;
extern u32 D_80084F34;
extern s16 D_800857F0;
extern u32 D_800854A4;

s32 func_800A112C(void) {
    register u32 value asm("$4") = D_8008A5B2;
    register u32 expected asm("$3") = 1;
    register s32 result asm("$2") = 0;

    if (value == expected) {
        expected = *(u32*)(D_80086178 + 0x20);
        value = D_80084F34;
        if (value == expected) {
            expected = D_800857F0;
            if (expected == 0) {
                result = D_800854A4 == 0;
            }
        }
    }
    return result;
}
