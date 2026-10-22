#include "types.h"

typedef struct Mtx {
    s32 m[4][4];
} Mtx;

extern f32 __sinf(f32 value);
extern f32 __cosf(f32 value);
extern void guMtxF2L(f32 source[4][4], Mtx* destination);

void guPositionF(f32 mf[4][4], f32 roll, f32 pitch, f32 yaw, f32 scale,
                 f32 x, f32 y, f32 z) {
    static f32 degreesToRadians = 3.1415926f / 180.0f;
    f32 sinRoll;
    f32 sinPitch;
    f32 sinYaw;
    f32 cosRoll;
    f32 cosPitch;
    f32 cosYaw;

    roll *= degreesToRadians;
    pitch *= degreesToRadians;
    yaw *= degreesToRadians;
    sinRoll = __sinf(roll);
    cosRoll = __cosf(roll);
    sinPitch = __sinf(pitch);
    cosPitch = __cosf(pitch);
    sinYaw = __sinf(yaw);
    cosYaw = __cosf(yaw);

    mf[0][0] = (cosPitch * cosYaw) * scale;
    mf[0][1] = (cosPitch * sinYaw) * scale;
    mf[0][2] = (-sinPitch) * scale;
    mf[0][3] = 0.0f;
    mf[1][0] = (sinRoll * sinPitch * cosYaw - cosRoll * sinYaw) * scale;
    mf[1][1] = (sinRoll * sinPitch * sinYaw + cosRoll * cosYaw) * scale;
    mf[1][2] = (sinRoll * cosPitch) * scale;
    mf[1][3] = 0.0f;
    mf[2][0] = (cosRoll * sinPitch * cosYaw + sinRoll * sinYaw) * scale;
    mf[2][1] = (cosRoll * sinPitch * sinYaw - sinRoll * cosYaw) * scale;
    mf[2][2] = (cosRoll * cosPitch) * scale;
    mf[2][3] = 0.0f;
    mf[3][0] = x;
    mf[3][1] = y;
    mf[3][2] = z;
    mf[3][3] = 1.0f;
}

void guPosition(Mtx* m, f32 roll, f32 pitch, f32 yaw, f32 scale,
                f32 x, f32 y, f32 z) {
    f32 mf[4][4];

    guPositionF(mf, roll, pitch, yaw, scale, x, y, z);
    guMtxF2L(mf, m);
}
