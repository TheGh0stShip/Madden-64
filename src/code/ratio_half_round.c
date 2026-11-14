#include "types.h"

/* IJG libjpeg 6a jquant1.c: largest_input_value(). */
s32 func_8006012C(s32 unused0, s32 unused1, s32 value, s32 scale) {
    return ((value * 2 + 1) * 255 + scale) / (scale * 2);
}
