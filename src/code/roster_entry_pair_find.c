#include "types.h"

extern u8 D_800816A7[];
extern u8 func_8003C6B4(u32 roster, u32 index);
extern u8 func_8003C708(u32 roster, u32 index);

s32 func_80022538(u32 team, u32 roster, s32 first, s32 second)
{
    register u32 index __asm__("$18") = 0;
    register u32 saved_roster __asm__("$17") = (u16)roster;
    register s32 saved_first __asm__("$21") = (s16)first;
    register s32 saved_second __asm__("$20") = (s16)second;
    register u8 *entries __asm__("$19");
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

        if (func_8003C6B4(saved_roster, slot) == saved_first &&
            func_8003C708(saved_roster, slot) == saved_second) {
            register u8 *result __asm__("$2") = entries + slot;
            return *result;
        }
        index++;
    } while ((u16)index < 11);

    return -1;
}
