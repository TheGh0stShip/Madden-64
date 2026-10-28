#include "types.h"

typedef struct {
    s32 x;
    s32 y;
    s32 z;
    s32 w;
} Pos4;

typedef struct {
    u8 pad00[0x1C];
    s32 x;
    s32 y;
    s32 z;
    u8 pad28[4];
    s32 vx;
    s32 vy;
    s32 vz;
} Body;

void func_800B9554(Body *, u16);

s32 func_800BD408(Body *body, u16 dt) {
    Pos4 prev;
    s32 hi;

    prev.x = body->x;
    prev.y = body->y;
    body->x += body->vx * dt;
    hi = body->x >> 16;
    if (hi < -0x210) {
        body->x = -0x02100000;
    }
    if (hi > 0x210) {
        body->x = 0x02100000;
    }
    body->y += body->vy * dt;
    hi = body->y >> 16;
    if (hi < -0x400) {
        body->y = -0x04000000;
    }
    if (hi > 0x400) {
        body->y = 0x04000000;
    }
    body->z += body->vz * dt;
    if (body->z < 0) {
        func_800B9554(body, dt);
    }
    return body->vx != 0 || body->vy != 0;
}
