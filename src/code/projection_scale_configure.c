#include "types.h"

extern void func_800468A8(void *matrix, f32 left, f32 right, f32 bottom,
                          f32 top, f32 near, f32 far, f32 scale);

void projection_scale_configure(void *object)
{
    u8 *base = object;
    f32 width = *(u16 *)(base + 4);
    f64 width_d = width;
    f32 far = width_d * 100.0;
    s32 scale = 4;
    f32 horizontal = 160.0f;
    f32 vertical = 120.0f;

    while (width_d > 76.8) {
        width_d *= 0.5;
        width = width_d;
        horizontal = (f64)horizontal * 0.5;
        vertical = (f64)vertical * 0.5;
        scale <<= 1;
        width_d = width;
    }

    func_800468A8(base + 0x68, horizontal, -horizontal, -vertical,
                  vertical, width, far, 1.0f);
    if ((u32)scale > 0x100) {
        scale = 0x100;
    }
    *(s16 *)(base + 0x1E8) = scale;
}
