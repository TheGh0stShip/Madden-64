#include "types.h"

typedef struct {
    s32 x;
    s32 y;
    s32 z;
} Vec3;

extern s32 D_80080C10;
extern s16 D_80087AF0;

void func_8009BD04(s32);
void func_800B9274(s16, Vec3 *, s32);

void func_800A5684(Vec3 *pos, s32 unused, s16 angle) {
    Vec3 delta;
    s32 x;

    func_800B9274(angle, &delta, (((angle + 0x3FF) & 0xFFF) < 0x7FF) << 20);
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
    if (pos->y < (s32)0xFCE40000 && D_80087AF0 == -1) {
        pos->y = (s32)0xFCD00000;
    }
}
