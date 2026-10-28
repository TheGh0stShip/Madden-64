#include "types.h"

/* Signed distance from a to b in units of 16, rounded to nearest. */
s16 func_800BDA50(s16 a, s16 b) {
    s32 diff;
    s32 t;
    s32 q;
    s32 result;

    if (a <= b) {
        diff = (s16)(b - a);
        t = diff;
        if (diff < 0) {
            t = diff + 15;
        }
        q = t >> 4;
        if ((s16)(diff - (q << 4)) < 8) {
            result = q;
        } else {
            result = q + 1;
        }
    } else {
        diff = (s16)(a - b);
        t = diff;
        if (diff < 0) {
            t = diff + 15;
        }
        q = t >> 4;
        if ((s16)(diff - (q << 4)) < 8) {
            result = q;
        } else {
            result = q + 1;
        }
        result = -result;
    }
    return result;
}
