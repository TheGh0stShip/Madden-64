#include "types.h"

extern s32 D_80073508;
extern u8 D_80087B78[];

s32 audio_level_calculate(u32 index, s32 level, s32 primary)
{
    register s32 bounded __asm__("$3");
    register s32 nonnegative __asm__("$2");
    s32 scale;

    level++;
    bounded = 0x80;
    if (level < 0x81) {
        bounded = level;
    }
    level = bounded;
    nonnegative = ~level >> 31;
    level &= nonnegative;
    level *= D_80073508 + 1;
    if (primary != 0) {
        scale = *(s32 *)(D_80087B78 + index * 16 + 4);
    } else {
        scale = *(s32 *)(D_80087B78 + index * 16);
    }
    level *= scale;
    level >>= 14;
    if (level >= 16) {
        level = 15;
    }
    nonnegative = ~level >> 31;
    return level & nonnegative;
}
