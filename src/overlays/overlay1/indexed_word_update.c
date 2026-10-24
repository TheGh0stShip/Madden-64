#include "types.h"

extern u32 D_800878A8[];
extern u32 D_80089380[];

u32 func_800C1DB8(u8* object) {
    u32* values = D_80089380;
    u8 index = object[0x21] & 0xBF;
    u32 value = D_800878A8[index];
    u32 previous = values[index];

    values[index] = value;
    return (value ^ previous) & value;
}
