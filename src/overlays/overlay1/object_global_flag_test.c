#include "types.h"

extern u32 D_80080C10;

s32 func_800C0218(u8* object) {
    register u32 state asm("$3") = object[0x20];
    register s32 result asm("$2") = 0;

    if (state == 0) {
        result = D_80080C10 & 0x40;
        __asm__ volatile("" : "=r"(result) : "0"(result));
        result = result != 0;
    }
    return result;
}
