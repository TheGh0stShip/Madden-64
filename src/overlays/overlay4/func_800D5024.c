#include "types.h"

typedef struct Sub { u8 pad[0x14]; s32 flags; } Sub;
typedef struct Obj { u8 pad0[0x24]; Sub *sub; u16 flags; u8 pad2[0x8C - 0x2A]; s32 x8C; } Obj;

extern volatile u16 D_8008A5B4;
s32 func_800C0018(Obj *, s16, s32);
s32 func_800C0C8C(Obj *, s32);
s16 func_800C157C(Obj *);

s32 func_800D5024(Obj *arg0) {
    Sub *s;

    func_800C0018(arg0, func_800C157C(arg0), 0);
    arg0->x8C -= D_8008A5B4;
    if (arg0->x8C < 0) {
        s = arg0->sub;
        arg0->flags &= ~0x10;
        s->flags &= ~0x10000;
        func_800C0C8C(arg0, 0x60008);
        return 1;
    }
    return 0;
}
