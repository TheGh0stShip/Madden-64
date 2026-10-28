#include "types.h"

extern s16 func_80023F94(u32 team, u32 stat);

s32 roster_value_ratio_primary(u32 team, u32 numerator_stat,
                               u32 denominator_stat)
{
    u32 saved_numerator_stat = numerator_stat;
    u32 saved_team = (u16)team;
    s32 denominator;
    s32 numerator;
    s32 result;

    denominator = (s16)func_80023F94(saved_team, (u16)denominator_stat);
    if (denominator == 0) {
        s32 zero = 0;
        return zero;
    }
    numerator = (s16)func_80023F94(saved_team, (u16)saved_numerator_stat);
    result = (numerator * 100) / denominator;
    return (s16)result;
}
