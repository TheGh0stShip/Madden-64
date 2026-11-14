#include "types.h"

extern s32 D_80087214;

s32 func_80093D24(void) {
    s32 mode = D_80087214;
    s32 result = 0;
    s32 expected = 0x41;

    if (mode != expected) {
        result = mode != 0x200;
        expected |= result & 0x40;
    }
    return result | (expected & result & 0x40);
}
