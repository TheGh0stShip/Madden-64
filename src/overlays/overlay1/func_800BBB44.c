#include "types.h"

s32 func_800BBB44(s32 from, s32 to, u16 numerator, u16 denominator) {
    s32 delta = to - from;
    s32 result;

    if (delta < -0x2FFFFF || delta > 0x2FFFFF) {
        delta >>= 5;
        result = from + ((delta * numerator / denominator) << 5);
    } else {
        result = from + delta * numerator / denominator;
    }
    return result;
}
