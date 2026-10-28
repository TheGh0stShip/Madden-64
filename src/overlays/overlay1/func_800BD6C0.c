#include "types.h"

typedef struct {
    s32 x;
    s32 y;
} Vec2;

typedef struct {
    s32 x;
    s32 y;
    s32 z;
} Vec3;

extern u16 D_80064A4C;
extern u16 D_80064A4E;
extern s32 D_80086CFC;
extern Vec2 D_80087A70;

s32 func_8000C8EC(s32);
void func_800B9274(s16, Vec3 *, s32);

void func_800BD6C0(s32 arg0) {
    Vec3 delta;
    u16 angle = D_80064A4C;
    s32 speed;

    if (func_8000C8EC(D_80086CFC) != 0) {
        angle += 0x7FF;
    }
    speed = arg0 & 0xFFFF;
    func_800B9274(angle, &delta, ((speed * speed) / 2) * D_80064A4E);
    D_80087A70.x += delta.x;
    D_80087A70.y += delta.y;
}
