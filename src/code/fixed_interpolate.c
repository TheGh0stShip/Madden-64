#include "types.h"

s32 func_80042E90(s16 start, s16 end, s32 fraction) {
    register s32 end_value __asm__("$5") = end;
    register s32 start_value __asm__("$2") = start;
    register s32 fraction_value __asm__("$6");

    end_value -= start_value;
    fraction_value = (u8)fraction;
    fraction_value = end_value * fraction_value;
    start_value <<= 20;
    end_value = fraction_value << 12;
    return end_value + start_value;
}
