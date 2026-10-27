#include "types.h"

extern u8 D_800816A7[];
extern u8 func_8003C6B4(u32 roster, u32 index);

s32 func_80022638(u32 team, u32 roster, s32 value, u32 occurrence)
{
    register u32 matches __asm__("$18") = 0;
    register u32 index __asm__("$17") = 0;
    register s32 saved_value __asm__("$22") = (s16)value;
    register u32 saved_occurrence __asm__("$21") = (u16)occurrence;
    register u32 saved_roster __asm__("$19") = (u16)roster;
    register u8 *entries __asm__("$20");
    register u32 team_offset __asm__("$2");
    register u32 roster_offset __asm__("$3");
    register u8 *base __asm__("$4");

    team_offset = (u16)team * 8524;
    base = D_800816A7;
    roster_offset = saved_roster * 11;
    team_offset += (u32)base;
    entries = (u8 *)(roster_offset + team_offset);

    do {
        register u32 slot __asm__("$16") = (u16)index;

        if (func_8003C6B4(saved_roster, slot) == saved_value) {
            if ((u16)matches == saved_occurrence) {
                register u8 *result __asm__("$2") = entries + slot;
                return *result;
            }
            matches++;
        }
        index++;
    } while ((u16)index < 11);

    return -1;
}
