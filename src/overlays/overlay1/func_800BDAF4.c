#include "types.h"

/* Rounded (800 - |distance|) / 16, clamped to at least one. */
s16 func_800BDAF4(s16 distance) {
    s16 magnitude;
    s32 value;
    s32 adjusted;
    s32 quotient;
    s16 result;

    magnitude = distance;
    if (distance < 0) {
        magnitude = -distance;
    }

    value = (s16)(800 - magnitude);
    adjusted = value;
    if (value < 0) {
        adjusted = value + 15;
    }
    quotient = adjusted >> 4;

    if ((s16)(value - quotient * 16) >= 8) {
        result = quotient + 1;
    } else {
        result = quotient;
    }
    if (result <= 0) {
        result = 1;
    }
    return result;
}
