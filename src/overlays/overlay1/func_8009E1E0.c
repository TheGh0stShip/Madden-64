#include "types.h"

typedef struct {
    s32 x;
    s32 y;
    s32 z;
} Vec3;

void func_8002DBD0(Vec3 *, Vec3 *);

void func_8009E1E0(Vec3 *in, Vec3 *out) {
    Vec3 view;
    f32 z;
    f32 x;
    f32 y;

    in->x <<= 16;
    in->y <<= 16;
    in->z <<= 16;
    func_8002DBD0(in, &view);
    in->x >>= 16;
    in->y >>= 16;
    in->z >>= 16;
    if (view.z == 0) {
        view.z = -0x10000;
    }
    x = (f32)view.x;
    x *= (1.0 / 65536.0);
    y = (f32)view.y;
    y *= (1.0 / 65536.0);
    z = (f32)view.z;
    z *= (1.0 / 65536.0);
    x = x * 300.0 / z;
    y = y * 300.0 / z;
    out->x = x;
    out->y = y;
    out->z = z;
}
