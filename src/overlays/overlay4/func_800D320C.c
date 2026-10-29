#include "types.h"

typedef struct Sub { u8 pad[0x14]; s32 flags; } Sub;
typedef struct Obj {
    u8 pad0[0x24]; Sub *sub; u16 flags; u8 pad1[0x30 - 0x2A]; s16 x30;
    u8 pad2[0x66 - 0x32]; u8 x66; u8 pad3[0x90 - 0x67];
    s32 x90; s32 x94; s32 x98; s32 x9C;
} Obj;

s32 func_800C0C8C(Obj *, s32);
s16 func_800C157C(Obj *);

s32 func_800D320C(Obj *arg0) {
    Sub *s;

    func_800C0C8C(arg0, 0x60008);
    s = arg0->sub;
    s->flags |= 0x10000;
    arg0->x90 = 0;
    arg0->flags |= 0x10;
    arg0->x94 = ((func_800C157C(arg0) + 0xFF) >> 9) & 7;
    arg0->x98 = 0;
    arg0->x9C = arg0->x66;
    arg0->x30 /= 3;
    return 0;
}
