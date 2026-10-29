#include "types.h"

typedef struct Sub { u8 pad[0x14]; s32 flags; } Sub;
typedef struct Obj {
    u8 pad0[0xC]; s16 xC; u8 pad2[0x24 - 0xE]; Sub *sub; u16 flags;
} Obj;

s32 func_800B96C0(Sub *, s32 *);
s32 func_800C0018(Obj *, s16, s32);
s32 func_800C0B64(Obj *, s32);
s32 func_800C0BBC(Obj *, s32);
s16 func_800C157C(Obj *);
extern s32 D_800748B4;

s32 func_800D33A8(Obj *arg0) {
    Sub *s;

    func_800C0BBC(arg0, 0x14);
    s = arg0->sub;
    s->flags |= 0x10000;
    arg0->flags |= 0x10;
    func_800C0018(arg0, func_800C157C(arg0), 0);
    func_800C0B64(arg0, 0xFFFF3334);
    func_800B96C0(arg0->sub, &D_800748B4);
    arg0->xC -= 0x10;
    if (arg0->xC < -0x8C) {
        arg0->xC = -0x8C;
    }
    return 0;
}
