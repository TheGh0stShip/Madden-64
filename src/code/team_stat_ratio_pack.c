#include "types.h"

extern s16 func_80023F94(u32 team, u32 stat);

u32 team_stat_ratio_pack(u32 team, u32 numerator_stat, u32 denominator_stat)
{
    register u32 saved_numerator_stat __asm__("$18") = numerator_stat;
    register u32 saved_team __asm__("$17") = (u16)team;
    register s32 denominator __asm__("$16");
    s32 numerator;
    s32 ratio;
    register s32 whole __asm__("$2");
    register u32 remainder __asm__("$4");

    __asm__("" : "=r"(saved_numerator_stat), "=r"(saved_team)
            : "0"(saved_numerator_stat), "1"(saved_team));
    denominator = (s16)func_80023F94(saved_team, (u16)denominator_stat);
    if (denominator == 0) {
        register u32 zero __asm__("$2");
        __asm__("" : "=r"(zero) : "0"(0));
        return zero;
    }
    numerator = (s16)func_80023F94(saved_team, (u16)saved_numerator_stat);
    ratio = (numerator * 10) / denominator;
    whole = ratio / 10;
    remainder = (ratio - whole * 10) & 0xFFFF;
    whole <<= 16;
    return whole | remainder;
}
