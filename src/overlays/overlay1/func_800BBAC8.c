#include "types.h"

/* Steps from toward to by num/den of the (wrapped 12-bit) distance. */
s32 func_800BBAC8(s32 from, s32 to, u16 num, u16 den) {
    s32 delta;
    s32 dist;
    s32 up;

    delta = to - from;
    up = to >= from;
    dist = delta;
    if (delta < 0) {
        dist = -delta;
    }
    delta = dist;
    if (delta >= 0x800) {
        delta -= 0xFFF;
    }
    delta = delta * num / den;
    if (up) {
        return from + delta;
    }
    return from - delta;
}
