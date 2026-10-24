#include "types.h"

#ifndef FUNCTION
#define FUNCTION func_80024B90
#endif

#ifndef TABLE
#define TABLE D_8006BAC0
#endif

extern u8* TABLE;

s32 FUNCTION(s32 index) {
    register s32 input __asm__("$4") = index;
    register s32 original __asm__("$5") = input;
    register u32 high __asm__("$4");
    register u32 offset __asm__("$2");
    register u32 full __asm__("$3");

    __asm__ volatile("" : "=r"(input) : "0"(input));
    high = (u16)input & 0x8000;
    offset = (u16)original & 0x7FFF;
    if (high) {
        return TABLE[offset + 0x17CD];
    }
    full = (u16)original;
    return TABLE[full];
}
