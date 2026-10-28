#include "types.h"

extern u8 D_80081876[];

void func_80025A4C(u16 primary, u16 secondary, u16 field, s32 amount) {
    u32 primary_offset;
    u32 secondary_offset;
    u32 secondary_value;
    u8* base;
    u16* value;

    primary_offset = primary * 8524;
    secondary_value = secondary;
    base = D_80081876;
    secondary_offset = secondary_value * 94;
    primary_offset += (u32)base;
    secondary_offset += primary_offset;
    value = (u16*)(field * 2 + secondary_offset);
    *value += amount;
}
