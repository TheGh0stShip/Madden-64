#include "types.h"

extern u16 D_80080CFC;
extern u16 D_80082D84;
typedef struct TeamAvailabilityFlag { char value; u8 pad[7]; } TeamAvailabilityFlag;
extern TeamAvailabilityFlag D_80073E29[];

s32 team_slot_available_test(s32 group, s32 entry)
{
    s32 product;
    s32 entry_offset = entry;
    u16 value;
    s16 index;
    u16 *base;
    s32 offset;
    u16 slot_value;

    index = 0;
    product = (s16)group * 8524;
    group = product;
    entry_offset <<= 16;
    base = &D_80080CFC;
    entry_offset >>= 15;
    base = (u16 *)((u32)base + group);
    entry_offset += (u32)base;
    value = *(u16 *)entry_offset;
    do {
        product = index * 4;
        offset = product + group;
        slot_value = *(u16 *)((u32)&D_80082D84 + offset);
        if (value != slot_value) goto next;
        if (*(u8 *)((u32)&D_80082D84 + offset + 3) == 0x80) goto yes;
        if (D_80073E29[*(u8 *)((u32)&D_80082D84 + offset + 2)].value != -1) goto yes;
        return 0;
next:;
        index++;
    } while (index < 4);
yes:
    return 1;
}
