#include "types.h"

extern u8 D_800816A7[];
extern u8 func_8003C6B4(u32 roster, u32 index);
extern u8 func_8003C708(u32 roster, u32 index);

s32 func_80022538(u32 team, u32 roster, s32 first, s32 second)
{
    register u32 index = 0;
    register u32 saved_roster = (u16)roster;
    register s32 saved_first = (s16)first;
    register s32 saved_second = (s16)second;
    register u8 *entries;
    register u32 team_offset;
    register u32 roster_offset;
    register u8 *base;

    team_offset = (u16)team * 8524;
    base = D_800816A7;
    roster_offset = saved_roster * 11;
    team_offset += (u32)base;
    entries = (u8 *)(roster_offset + team_offset);

    do {
        register u32 slot = (u16)index;

        if (func_8003C6B4(saved_roster, slot) == saved_first &&
            func_8003C708(saved_roster, slot) == saved_second) {
            register u8 *result = entries + slot;
            return *result;
        }
        index++;
    } while ((u16)index < 11);

    return -1;
}
