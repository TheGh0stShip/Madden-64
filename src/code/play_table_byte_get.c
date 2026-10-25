#include "types.h"

extern u8 D_800816A7[];

u8 func_80022188(u16 primary, u16 secondary, u16 field) {
    register u32 primary_offset __asm__("$2");
    register u32 secondary_offset __asm__("$3");
    register u32 secondary_value __asm__("$5");
    register u8* base __asm__("$4");

    primary_offset = primary * 8524;
    secondary_value = secondary;
    __asm__ volatile("" : "=r"(secondary_value) : "0"(secondary_value));
    base = D_800816A7;
    __asm__ volatile("" : "=r"(base) : "0"(base));
    secondary_offset = secondary_value * 11;
    primary_offset += (u32)base;
    secondary_offset += primary_offset;
    secondary_offset += field;
    return *(u8*)secondary_offset;
}
