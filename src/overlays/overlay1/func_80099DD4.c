#include "types.h"

typedef struct View {
    u8 pad00[0x28];
    f32 mtx[0x80];
    f32 scaleX;
    f32 scaleY;
    f32 offsetX;
    f32 offsetY;
} View;

extern View *D_8008B654;
void func_8002E01C(f32 *out, f32 *in, f32 *mtx);

s32 func_80099DD4(f32 *out, f32 *in) {
    f32 v[4];
    f32 x, y, z, w;
    f32 inv;
    s32 ret;

    func_8002E01C(v, in, D_8008B654->mtx);
    w = v[3];
    if (w != 0.0) {
        inv = 1.0 / w;
    } else {
        w = 1.0f;
        inv = w;
    }
    z = v[2] * inv;
    x = v[0] * inv;
    y = v[1] * inv;
    ret = 0;
    if (z < 0.0) {
        z = 0.0f;
        ret = 1;
    } else if (z > 1.0) {
        ret = 2;
    }
    if (x < -4.0) {
        x = -4.0f;
    }
    if (x > 4.0) {
        x = 4.0f;
    }
    if (y < -4.0) {
        y = -4.0f;
    }
    if (y > 4.0) {
        y = 4.0f;
    }
    x = x * D_8008B654->scaleX + D_8008B654->offsetX;
    y = y * D_8008B654->scaleY + D_8008B654->offsetY;
    y = D_8008B654->scaleY * 2.0 - y;
    z = z * 32767.0;
    out[2] = w;
    out[0] = x;
    out[1] = y;
    out[3] = z;
    return ret;
}
