#include "types.h"

extern s32 D_80073508;
extern s32 D_80085108;
extern s32 D_8008B8CC;
extern s8 D_80087B10[];
extern void func_8003D8F4(s32 index, s32 first, s32 second);

void audio_position_prepare(s32 index, s16 value, s32 scale)
{
    register s32 saved_index __asm__("$8") = index;
    register s32 saved_scale __asm__("$7") = scale;
    register s32 base __asm__("$4");
    register s32 signed_value __asm__("$2");
    register s32 raw __asm__("$3");
    register s32 original_raw __asm__("$6");
    register s32 rounded __asm__("$3");
    register s32 first __asm__("$5");
    register s32 second __asm__("$6");
    register s32 complement __asm__("$2");

    base = D_80073508;
    if (base == 0) {
        return;
    }

    signed_value = value;
    __asm__("" : "=r"(signed_value) : "0"(signed_value));
    raw = base << 2;
    raw += base;
    raw <<= 1;
    base = (signed_value << 1) + signed_value;
    raw += base;
    raw += 0x3C;
    original_raw = raw;
    __asm__("" : "=r"(raw) : "0"(raw), "r"(original_raw));
    rounded = (s16)raw;
    D_80085108 = saved_index;
    D_8008B8CC = signed_value;
    rounded /= 16;
    second = original_raw;
    if ((s16)saved_scale < 0x10) {
        first = original_raw;
        second = rounded * saved_scale;
    } else {
        complement = 0x20 - saved_scale;
        first = rounded * complement;
    }

    if (D_80087B10[saved_index] < 0) {
        first <<= 16;
        second <<= 16;
        func_8003D8F4(saved_index, first >> 16, second >> 16);
    }
}
