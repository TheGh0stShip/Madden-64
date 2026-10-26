#include "types.h"

typedef struct TransformOwner {
    u8 pad00[8];
    u8 *transform;
} TransformOwner;

extern f32 D_800006D0;
extern void func_800480D8(void *output, void *transform, f32 first, f32 second,
                          s32 mode, f32 x, f32 y, f32 z, s32 zero_a,
                          s32 zero_b, f32 scale);

void func_8000F344(TransformOwner *object, f32 first, f32 second, s32 mode,
                   f32 x, f32 y, f32 z)
{
    u8 output[0x40];

    func_800480D8(output, object->transform + 0xD8, first, -second, mode,
                  -x, -y, -z, 0, 0, D_800006D0);
}
