#include "types.h"

extern u8 D_80081876[];

void func_80025A4C(u16 primary, u16 secondary, u16 field, s32 amount) {
    register u32 primary_offset __asm__("$2");
    register u32 secondary_offset __asm__("$3");
    register u32 secondary_value __asm__("$5");
    register u8* base __asm__("$4");
    register u16* value __asm__("$6");

    primary_offset = primary * 8524;
    secondary_value = secondary;
    __asm__ volatile("" : "=r"(secondary_value) : "0"(secondary_value));
    base = D_80081876;
    __asm__ volatile("" : "=r"(base) : "0"(base));
    secondary_offset = secondary_value * 94;
    primary_offset += (u32)base;
    secondary_offset += primary_offset;
    value = (u16*)(field * 2 + secondary_offset);
    __asm__ volatile("" : "=r"(value) : "0"(value));
    *value += amount;
}
