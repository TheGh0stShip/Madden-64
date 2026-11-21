#include "types.h"

typedef struct {
    s32 x;
    s32 y;
    s32 z;
} Vec3;

s32 func_800998F8(Vec3 *a, Vec3 *b, Vec3 *out, s32 range) {
    s32 result = 0;
    s32 d;
    s32 x;
    s32 y;
    s32 v;

    d = b->z - a->z;
    if (d >= 0) {
        x = a->x + a->z * (b->x - a->x);
        y = a->y + a->z * (b->y - a->y);
    } else {
        x = a->x - a->z * (b->x - a->x) / d;
        y = a->y - a->z * (b->y - a->y) / d;
    }
    v = x < -0x7FFF ? -0x7FFF : (x > 0x7FFF ? 0x7FFF : x);
    out->x = v;
    v = y < -0x7FFF ? -0x7FFF : (y > 0x7FFF ? 0x7FFF : y);
    out->y = v;
    out->z = 0;
    if (out->x < a->x - range) {
        result = -1;
        out->x = a->x - range;
    }
    if (out->x > a->x + range) {
        result = -1;
        out->x = a->x + range;
    }
    if (out->y < a->y - range) {
        result = -1;
        out->y = a->y - range;
    }
    if (out->y > a->y + range) {
        result = -1;
        out->y = a->y + range;
    }
    return result;
}
