#include "types.h"

typedef struct {
    s16 x;
    s16 z;
    s16 bottom;
    s16 top;
    u16 radius;
} Bounds;

typedef struct {
    u8 unk_00[0x1C];
    s32 x;
    s32 z;
    s16 y;
} Body;

u16 func_800B9B84(Body *a, Bounds *ab, Body *b, Bounds *bb) {
    s32 x;
    s32 z;
    s32 ax;
    s32 az;
    s32 d;

    x = ((ab->x << 16) + a->x) - ((bb->x << 16) + b->x);
    z = ((ab->z << 16) + a->z) - ((bb->z << 16) + b->z);
    ax = x;
    if (x < 0) {
        ax = -x;
    }
    az = z;
    if (z < 0) {
        az = -z;
    }
    if (ax < az) {
        d = az + ax / 2;
    } else {
        d = ax + az / 2;
    }
    d >>= 16;
    if (ab->radius + bb->radius < d) {
        return 0;
    }
    x = a->y;
    z = b->y;
    d = z + bb->top;
    if (x + ab->top >= d && d >= x + ab->bottom) {
        return 1;
    }
    d = z + bb->bottom;
    if (x + ab->top >= d && d >= x + ab->bottom) {
        return 1;
    }
    d = x + ab->top;
    if (z + bb->top < d || d < z + bb->bottom) {
        return 0;
    }
    return 1;
}
