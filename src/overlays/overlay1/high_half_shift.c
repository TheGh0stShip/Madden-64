#include "types.h"

u32 func_800A7514(s32 unused, u32 value) {
    u32 result = value << 16;

    __asm__ volatile ("" : : "r"(result));
    return result;
}
