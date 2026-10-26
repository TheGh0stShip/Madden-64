#include "types.h"

extern s16 D_80089320;
extern volatile u16 D_80082D50[][0x10A6];

void roster_stat_add(u32 team_arg, u32 stat_arg, s32 amount)
{
    s32 index;
    s32 stat;
    u32 team_offset;

    if (D_80089320 != 0) {
        goto range_23_26;
    }
    index = (u16)stat_arg;
    if (index < 8) {
        return;
    }
    if (index < 10) {
        goto range_23_26;
    }
    if (index >= 15) {
        return;
    }
    if (index < 13) {
        return;
    }
range_23_26:
    stat = (s32)(u16)stat_arg;
    if (stat >= 27) {
        goto update;
    }
    if (stat >= 23) {
        return;
    }
update:
    team_offset = (u16)team_arg * 0x214C;
    __asm__ volatile("" ::: "memory");
    team_arg = (u32)D_80082D50;
    ((volatile u16 *)((u8 *)team_arg + team_offset))[stat] += amount;
}
