#include "types.h"

extern u32 D_80087998;

u16 runtime_sequence_advance(void) {
    u32 lo = D_80087998;
    u32 hi = lo >> 16;
    u32 a;
    u32 b;

    lo &= 0xFFFF;
    a = hi + hi * 58924;
    lo = lo + lo * 58924;
    hi = hi * 47936 + lo;
    b = ((a << 16) | (a >> 16)) + hi;
    a = (b << 16) | (b >> 16);
    a += 1;
    D_80087998 = a;
    return a;
}
