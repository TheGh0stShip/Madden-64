#include "types.h"

typedef struct Sub { u8 pad[0x1C]; s32 x1C; s32 x20; u8 pad2[0x2C - 0x24]; s32 x2C; s32 x30; } Sub;

s32 func_8002E7A0(s32, s32);
extern Sub *D_80086178;
extern s32 D_80087A70;
extern s32 D_80087A74;

s32 func_800D767C(void) {
    s32 dx, dz, d, vx, vz, v;

    if (D_80087A70 != 0x7FFFFFFF) {
    dx = D_80087A70 - D_80086178->x1C;
    if (dx < 0) {
        dx = -dx;
    }
    dz = D_80087A74 - D_80086178->x20;
    if (dz < 0) {
        dz = -dz;
    }
    if (dx < dz) {
        d = dz + dx / 2;
    } else {
        d = dx + dz / 2;
    }
    vx = D_80086178->x2C;
    if (vx < 0) {
        vx = -vx;
    }
    vz = D_80086178->x30;
    if (vz < 0) {
        vz = -vz;
    }
    if (vx < vz) {
        v = vz + vx / 2;
    } else {
        v = vx + vz / 2;
    }
    if ((v >> 8) != 0) {
        return func_8002E7A0(d, v * 60);
    }
    return 0;
    }
    return 0x1000;
}
