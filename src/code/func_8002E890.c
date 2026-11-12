#include "types.h"

extern s16 D_8006F2C0[];

s32 func_8002E890(s32 x, s32 y)
{
    s32 octant;
    s32 angle;
    f64 x_double;
    f64 y_double;

    if (x == 0) {
        return (y < 0 ? 0xC00 : 0) | 0x400;
    }
    if (y == 0) {
        return x < 0 ? 0x800 : 0;
    }

    octant = 0;
    if (x < 0) {
        x = -x;
        octant = 1;
    }
    if (y < 0) {
        y = -y;
        octant += 2;
    }
    if (!(y < x)) {
        x ^= y;
        y ^= x;
        x ^= y;
        octant += 4;
    }

    x_double = (f64)x;
    y_double = (f64)y;
    angle = D_8006F2C0[(s32)(y_double / x_double * 4096.0) & 0xFFF];
    switch (octant) {
    case 0:
        break;
    case 2:
        angle = 0x10000 - angle;
        break;
    case 1:
        angle = 0x8000 - angle;
        break;
    case 3:
        angle += 0x8000;
        break;
    case 4:
        angle = 0x4000 - angle;
        break;
    case 6:
        angle += 0xC000;
        break;
    case 5:
        angle += 0x4000;
        break;
    case 7:
        angle = 0xC000 - angle;
        break;
    }
    return angle >> 4;
}
