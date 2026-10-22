#include "types.h"

extern s32 D_80087214;

s32 func_80093D24(void) {
    register s32 mode asm("$4") = D_80087214;
    register s32 expected asm("$3") = 0x41;
    register s32 result asm("$2") = 0;

    if (mode != expected) {
        result = mode != 0x200;
    }
    return result;
}
