#include "types.h"

extern u8 D_800816A7[];

u8 func_80022188(u16 primary, u16 secondary, u16 field) {
    u32 primary_offset;
    u32 secondary_offset;
    u32 secondary_value;
    u8* base;

    do {
        primary_offset = primary * 8524;
    } while (0);
    secondary_value = secondary;
    do {
        base = D_800816A7;
    } while (0);
    secondary_offset = secondary_value * 11;
    primary_offset += (u32)base;
    secondary_offset += primary_offset;
    secondary_offset += field;
    return *(u8*)secondary_offset;
}
