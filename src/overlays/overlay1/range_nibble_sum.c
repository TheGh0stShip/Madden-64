#include "types.h"

extern u8 *D_800718E8;

s32 range_nibble_sum(s32 first_arg, s32 last_arg)
{
    s32 total = 0;
    u8 *record;

    first_arg = (first_arg << 16) >> 16;
    last_arg = (last_arg << 16) >> 16;
    if ((u32)last_arg >= (u32)first_arg) {
        record = (u8 *)((u32)(first_arg * 0x10) + (u32)D_800718E8);
        do {
            total += (*(u32 *)(record + 0x48) >> 7) & 0xF;
            first_arg++;
            record += 0x10;
        } while ((u32)last_arg >= (u32)first_arg);
    }
    return total;
}
