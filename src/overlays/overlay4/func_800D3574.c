#include "types.h"

typedef struct Sub { u8 pad[0x14]; s32 flags; } Sub;
typedef struct Obj {
    u8 pad0[0xC]; s16 xC; u8 pad1[0x24 - 0xE]; Sub *sub; u16 flags;
    u8 pad2[0x65 - 0x2A]; u8 x65; u8 pad3[0x8C - 0x66]; s32 x8C;
} Obj;

extern volatile u16 D_8008A5B4;
s32 func_800C0018(Obj *, s32, s32);
s32 func_800C0C8C(Obj *, s32);

s32 func_800D3574(Obj *arg0) {
    Sub *s;

    func_800C0018(arg0, arg0->x65 * 0x10, 0);
    arg0->x8C -= D_8008A5B4;
    if (arg0->x8C < 0) {
        arg0->xC -= 0x60;
        if (arg0->xC < -0x8C) {
            arg0->xC = -0x8C;
        }
        s = arg0->sub;
        arg0->flags &= ~0x10;
        s->flags &= ~0x10000;
        func_800C0C8C(arg0, 0x60008);
        return 1;
    }
    return 0;
}
