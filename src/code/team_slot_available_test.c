#include "types.h"

extern u16 D_80080CFC;
extern u16 D_80082D84;
typedef struct TeamAvailabilityFlag { char value; u8 pad[7]; } TeamAvailabilityFlag;
extern TeamAvailabilityFlag D_80073E29[];

s32 team_slot_available_test(s32 group, s32 entry)
{
    register s32 group_offset __asm__("$4");
    register s32 product __asm__("$2");
    register s32 entry_offset __asm__("$5") = entry;
    u16 value;
    s16 index;
    register u16 *base __asm__("$2");
    s32 offset;
    u16 slot_value;

    index = 0;
    __asm__("" : "=r"(index) : "0"(index));
    product = (s16)group * 8524;
    __asm__("" : "=r"(product) : "0"(product));
    group_offset = product;
    __asm__("" : "=r"(group_offset) : "0"(group_offset));
    entry_offset <<= 16;
    __asm__("" : "=r"(entry_offset) : "0"(entry_offset));
    base = &D_80080CFC;
    entry_offset >>= 15;
    base = (u16 *)((u32)base + group_offset);
    entry_offset += (u32)base;
    __asm__("" : "=r"(entry_offset) : "0"(entry_offset));
    value = *(u16 *)entry_offset;
    do {
        offset = index * 4;
        offset += group_offset;
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
