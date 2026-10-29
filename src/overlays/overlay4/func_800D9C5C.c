#include "types.h"

typedef struct { s32 x; s32 y; s32 z; } Vec3i;
typedef struct { u8 pad[0x1C]; s32 unk1C; s32 unk20; } Sub;
typedef struct Obj { u8 pad[0x24]; Sub *unk24; u8 pad28[0x8C-0x28]; s32 unk8C; u8 pad90[0x98-0x90]; s32 unk98; struct Obj *unk9C; u8 padA0[4]; s32 unkA4; } Obj;
extern void func_800B9208(Vec3i *);

s32 func_800D9C5C(Obj *a0) {
    Vec3i v;
    s32 dx;
    Obj *t = a0->unk9C;
    if (t == 0) {
        return 0;
    }
    v.x = t->unk24->unk1C - a0->unk24->unk1C;
    v.y = t->unk24->unk20 - a0->unk24->unk20;
    dx = v.x;
    if (dx < 0) {
        dx = -dx;
    }
    if (dx > 0x400000) {
        return 0;
    }
    if (v.y > (s32)0xFFD00000) {
        return 0;
    }
    if (a0->unk8C >= 0x3D) {
        return 0;
    }
    func_800B9208(&v);
    a0->unk98 = (v.x < 0) ? 0xF00 : 0xFF;
    a0->unkA4 = 0x6666;
    return 1;
}
