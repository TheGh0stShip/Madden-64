#include "types.h"

typedef struct {
    s32 x;
    s32 y;
    s32 z;
} Vec3i;

extern u16 D_80064A4C;
extern u16 D_80064A4E;
extern s32 D_80086CFC;

s32 func_8000C8EC(s32);
void func_800B9274(s16, Vec3i *, s32);

/* Moves the object along the camera heading (reversed when func_8000C8EC is set) by speed, in 24.8 fixed point. */
void func_800BD610(u8 *obj, u16 speed) {
    Vec3i delta;
    u16 angle;

    if (*(s32 *)(obj + 0x24) > 0) {
        angle = D_80064A4C;
        if (func_8000C8EC(D_80086CFC) != 0) {
            angle += 0x7FF;
        }
        func_800B9274(angle, &delta, (D_80064A4E * speed) << 8);
        *(s32 *)(obj + 0x2C) += delta.x >> 8;
        *(s32 *)(obj + 0x30) += delta.y >> 8;
    }
}
