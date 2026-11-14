#include "types.h"

/* IJG libjpeg 6a jquant1.c: output_value(). */
s32 func_800600E0(s32 unused0, s32 unused1, s32 value, s32 scale) {
    return (value * 255 + scale / 2) / scale;
}
