#include "types.h"

extern f32 D_80065560;
extern s32 func_8002E828(u16 angle);
extern s32 func_8002E848(u16 angle);

void render_pipeline_update(f32 x, f32 y, f32 z, f32 *m00, f32 *m01, f32 *m02, f32 *m10, f32 *m11, f32 *m12,
                            f32 *m20, f32 *m21, f32 *m22, u16 angle) {
    f32 c;
    f32 s;
    f32 t;

    c = func_8002E828(angle) * D_80065560;
    s = func_8002E848(angle) * D_80065560;
    t = 1.0 - c;
    *m00 = x * x + c * (1.0 - x * x);
    *m01 = x * y * t - z * s;
    *m02 = z * x * t + y * s;
    *m10 = x * y * t + z * s;
    *m11 = y * y + c * (1.0 - y * y);
    *m12 = y * z * t - x * s;
    *m20 = z * x * t - y * s;
    *m21 = y * z * t + x * s;
    *m22 = z * z + c * (1.0 - z * z);
}
