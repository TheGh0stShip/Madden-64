#include "types.h"

#ifndef FUNCTION
#define FUNCTION func_8001C670
#endif

extern u8* D_80079478;
extern u16 D_80079524;
extern u16 D_80079528;

s32 FUNCTION(void) {
    u8* source = D_80079478;
    u32 value;
    u32 upper;
    u32 offset;

    value = source[0];
    D_80079478 = source + 1;
    upper = source[1];
    D_80079478 = source + 2;
#ifdef USE_SECOND_OFFSET
    offset = D_80079528;
#else
    offset = D_80079524;
#endif
    upper <<= 8;
    value |= upper;
    value += offset;
    return (s16)value;
}
