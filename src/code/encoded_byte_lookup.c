#include "types.h"

#ifndef FUNCTION
#define FUNCTION func_80024B90
#endif

#ifndef TABLE
#define TABLE D_8006BAC0
#endif

extern u8* TABLE;

s32 FUNCTION(s32 index) {
    u16 original = index;

    index = (u16)index & 0x8000;
    if (index) {
        return TABLE[(original & 0x7FFF) + 0x17CD];
    }
    return TABLE[original];
}
