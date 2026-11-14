#include "types.h"
extern s16 func_800241A0(u32 team, u32 stat);
u32 team_stat_ratio_pack_secondary(u16 team, u32 numerator_stat, u16 denominator_stat)
{
    s32 denominator;
    s32 numerator;
    s32 ratio; s32 whole; u32 remainder;
    denominator = func_800241A0(team, denominator_stat);
    if (denominator == 0) {
        return 0;
    }
    numerator = func_800241A0(team, (u16)numerator_stat);
    ratio = (numerator * 10) / denominator;
    whole = ratio / 10;
    remainder = (ratio - whole * 10) & 0xFFFF;
    return (whole << 16) | remainder;
}
