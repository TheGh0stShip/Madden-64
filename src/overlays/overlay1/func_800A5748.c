#include "types.h"

typedef struct {
    s32 x;
    s32 y;
    s32 z;
} Vec3i;

extern s32 D_80080C10;
extern s16 D_80087AF0;

void func_8009BD04(s32);
void func_800B9274(s16, Vec3i *);

void func_800A5748(Vec3i *pos, s32 angle) {
    Vec3i delta;
    s32 x;

    func_800B9274(angle << 5, &delta);
    pos->x += delta.x;
    pos->y += delta.y;
    if (D_80080C10 & 0x200) {
        x = pos->x;
        if (x < 0) {
            x = -x;
        }
        if (x > 0x187FFFF) {
            func_8009BD04(3);
        }
    }
    if (pos->y < -0x31C0000 && D_80087AF0 == -1) {
        pos->y = -0x3300000;
    }
}
