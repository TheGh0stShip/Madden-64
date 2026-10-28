#include "types.h"

typedef struct {
    s32 x;
    s32 y;
} Vec2;

s32 func_8002E890(s32, s32);

s16 func_800BD92C(Vec2 *v) {
    s32 angle;

    if ((u32)(v->x + 0xFE) < 0x1FD) {
        return (v->y >> 31) & 0x800;
    }
    angle = 0x400 - func_8002E890(v->x, v->y);
    if (angle < 0) {
        angle += 0x1000;
    }
    if (angle > 0x1000) {
        angle -= 0x1000;
    }
    return angle;
}
