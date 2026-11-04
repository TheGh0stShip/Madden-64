#include "types.h"

typedef struct {
    u8 pad00[0x14];
    s32 flags;
    u8 pad18[0xC];
    s32 unk24;
    u8 pad28[4];
    s32 velX;
    s32 velY;
    u8 pad34[8];
    u16 unk3C;
    u8 pad3E[6];
    s32 minSpeed;
} Mover;

extern s32 D_80087B64;

void func_800BD4FC(Mover *arg0, s32 arg1) {
    s32 factor;
    s32 v;
    s32 small;

    if ((arg0->flags & 0x20) && arg0->unk24 == 0) {
        factor = arg0->unk3C - 0x17C;
        if (factor >= 0) {
            factor = -1;
        }
        factor *= arg1 & 0xFFFF;
        factor = (factor * D_80087B64) >> 16;
        if (arg0->velX != 0) {
            v = arg0->velX + ((arg0->velX * factor) >> 11);
            arg0->velX = v;
            if (v > 0) {
                small = v < arg0->minSpeed;
            } else {
                small = -arg0->minSpeed < v;
            }
            if (small) {
                arg0->velX = 0;
            }
        }
        if (arg0->velY != 0) {
            v = arg0->velY + ((arg0->velY * factor) >> 11);
            arg0->velY = v;
            if (v > 0) {
                small = v < arg0->minSpeed;
            } else {
                small = -arg0->minSpeed < v;
            }
            if (small) {
                arg0->velY = 0;
            }
        }
    }
}
