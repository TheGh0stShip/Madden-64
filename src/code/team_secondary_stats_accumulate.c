#include "types.h"

extern u8 D_80080C90[];
extern u16 D_8006B9D8;
extern u8 *D_8006B9DC;
extern s32 func_80028A58(s32 value);
extern s32 func_800241A0(s32 team, s32 index);

void team_secondary_stats_accumulate(s32 team)
{
    register s32 saved_team __asm__("$17") = team;
    register s32 index __asm__("$16") = 0;
    register u16 *stats __asm__("$18");
    register u16 saved_selector __asm__("$19");
    register s32 temp_v1 __asm__("$3");
    register s32 temp_v0 __asm__("$2");
    u32 team_offset = (team & 0xFFFF) * 8524;
    u32 selector;

    selector = func_80028A58(D_80080C90[team_offset]);
    saved_selector = D_8006B9D8;
    __asm__("" : "=r"(saved_selector) : "0"(saved_selector));
    selector &= 0xFFFF;
    temp_v1 = selector << 5;
    temp_v1 -= selector;
    temp_v0 = (s32)D_8006B9DC;
    temp_v1 <<= 1;
    temp_v1 += 0x5358;
    D_8006B9D8 = 0;
    stats = (u16 *)(temp_v0 + temp_v1);
loop:
    {
        register s32 value __asm__("$2");
        register u16 *entry __asm__("$3");
        register u32 total __asm__("$5");
        register s32 next __asm__("$4");

        value = func_800241A0(saved_team & 0xFFFF, index & 0xFFFF);
        temp_v1 = index << 16;
        temp_v1 >>= 15;
        temp_v1 += (s32)stats;
        entry = (u16 *)temp_v1;
        total = *entry;
        next = index + 1;
        index = next;
        __asm__("" : "=r"(next) : "0"(next));
        next = (s16)next;
        next = next < 31;
        total += value;
        *entry = total;
        if (next) goto loop;
    }
    D_8006B9D8 = saved_selector;
}
