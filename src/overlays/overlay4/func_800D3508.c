#include "types.h"

typedef struct Sub { u8 pad[0x14]; s32 flags; } Sub;
typedef struct Obj {
    u8 pad0[0xC]; u16 xC; u8 pad1[0x17 - 0xE]; u8 x17;
    u8 pad2[0x24 - 0x18]; Sub *sub; u16 flags; u8 pad3[0x8C - 0x2A]; s32 x8C;
} Obj;

s32 func_800C0BBC(Obj *, s32);

s32 func_800D3508(Obj *arg0) {
    Sub *s;

    func_800C0BBC(arg0, 0x39);
    s = arg0->sub;
    s->flags |= 0x10000;
    arg0->flags |= 0x10;
    arg0->x8C = (arg0->x17 >> 4) + 0x14;
    arg0->xC += 0x50;
    return 0;
}
