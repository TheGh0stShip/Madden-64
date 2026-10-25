#include "types.h"

typedef struct Vector3 {
    s32 x;
    s32 y;
    s32 z;
} Vector3;

typedef struct VectorOwner {
    u8 pad00[0x24];
    struct {
        u8 pad00[0x2C];
        s32 x;
        s32 y;
    } *vector;
} VectorOwner;

extern void func_800B9274(s16 value, Vector3 *result, s32 angle);
extern void func_800B9184(Vector3 *target, Vector3 *source);
extern s16 func_800B9208(Vector3 *vector);
extern void func_800C16A0(VectorOwner *owner, s16 value);

void object_vector_commit(VectorOwner *owner, s32 value, s32 angle)
{
    Vector3 temporary;
    s16 result;

    if (owner->vector->x + owner->vector->y < 0x3000) {
        angle += 0x1800;
    }
    func_800B9274((s16)value, &temporary, angle + 0x1745);
    temporary.z = 0;
    func_800B9184((Vector3 *)owner->vector, &temporary);
    result = func_800B9208((Vector3 *)((u8 *)owner->vector + 0x2C));
    func_800C16A0(owner, result);
}
