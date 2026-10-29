#include "types.h"

typedef struct { s32 x; s32 y; s32 z; } Vec3i;
typedef struct { u8 pad[0x1C]; s32 unk1C; s32 unk20; } Sub;
typedef struct Obj { u8 pad[0x24]; Sub *unk24; u8 pad28[0x98-0x28]; s32 unk98; struct Obj *unk9C; u8 padA0[4]; s32 unkA4; } Obj;
extern s16 func_800C157C(Obj *);

s32 func_800D9B94(Obj *a0) {
    Vec3i v;
    s32 dx;
    Obj *t = a0->unk9C;
    if (t == 0) {
        return 0;
    }
    v.x = t->unk24->unk1C - a0->unk24->unk1C;
    v.y = t->unk24->unk20 - a0->unk24->unk20;
    if (((func_800C157C(t) + 0x1FF) & 0xFFF) >= 0x400) {
        return 0;
    }
    dx = v.x;
    if (dx < 0) {
        dx = -dx;
    }
    if (dx > 0x300000) {
        return 0;
    }
    if ((u32)(v.y + 0x700000) > 0x500000) {
        return 0;
    }
    a0->unk98 = 0;
    a0->unkA4 = 0x9999;
    return 1;
}
