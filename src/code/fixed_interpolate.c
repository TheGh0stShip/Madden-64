#include "types.h"

static __inline__ s32 multiply_values(s32 left, s32 right) {
    return left * right;
}

s32 func_80042E90(s16 start, s16 end, s32 fraction) {
    s32 end_value = end;
    s32 start_value = start;
    s32 fraction_value;

    end_value -= start_value;
    fraction_value = (u8)fraction;
    fraction_value = multiply_values(end_value, fraction_value);
    start_value <<= 20;
    end_value = fraction_value << 12;
    return end_value + start_value;
}
