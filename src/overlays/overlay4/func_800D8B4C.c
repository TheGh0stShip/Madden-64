#include "types.h"

typedef struct { s32 x; s32 y; s32 z; } Vec2i;
typedef struct { u8 pad[0x1C]; s32 unk1C; s32 unk20; } Sub;
typedef struct { u8 pad[0x24]; Sub *unk24; u16 unk28; u8 pad2A[0x65-0x2A]; u8 unk65; u8 unk66; u8 pad67[0x8C-0x67]; s32 unk8C; s32 unk90; s32 unk94; s32 unk98; } Obj;
extern void func_800B9274(s32, Vec2i *, s32);

s32 func_800D8B4C(Obj *a0) {
    Vec2i v;
    if (!(a0->unk28 & 1)) {
        func_800B9274(a0->unk66 << 5, &v, a0->unk65 << 18);
        a0->unk8C = a0->unk24->unk1C + v.x;
        a0->unk90 = a0->unk24->unk20 + v.y;
        a0->unk94 = a0->unk24->unk1C;
        a0->unk98 = a0->unk24->unk20;
    }
    return 0;
}
