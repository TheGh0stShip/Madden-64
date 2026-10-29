#include "types.h"

typedef struct Sub { u8 pad[0x14]; s32 flags; u8 pad1[0x1C - 0x18]; s32 x1C; s32 x20; u8 pad2[0x2C - 0x24]; s32 x2C; s32 x30; } Sub;
typedef struct Obj {
    u8 pad0[0x24]; Sub *sub; u16 flags; u8 pad1[0x2D - 0x2A]; u8 x2D; u8 pad1b[0x34 - 0x2E];
    s16 x34; s16 x36; u8 pad2[0x65 - 0x38]; u8 x65; u8 x66; u8 pad3[0x8C - 0x67]; s32 x8C;
} Obj;
typedef struct Vec { s32 x; s32 z; s32 pad[2]; } Vec;

s16 func_800B9208(Vec *);
s32 func_800B96C0(Sub *, s32 *);
s32 func_800C16A0(Obj *, s16);
extern s32 D_800748A8;
extern Sub *D_80086178;

s32 func_800D490C(Obj *arg0) {
    Vec v;
    Sub *p;
    Sub *s;

    switch (arg0->x65) {
    case 0:
        arg0->x34 = 0x1A;
        arg0->x36 = 1;
        break;
    case 1:
        arg0->x34 = 0x2A;
        arg0->x36 = 1;
        func_800B96C0(arg0->sub, &D_800748A8);
        break;
    }
    arg0->sub->flags |= 0x10000;
    if (arg0->x66 == 0) {
        p = D_80086178;
        arg0->flags |= 0x10;
        s = arg0->sub;
        s->x30 = 0;
        s->x2C = 0;
        v.x = p->x1C - arg0->sub->x1C;
        v.z = p->x20 - arg0->sub->x20;
        func_800C16A0(arg0, func_800B9208(&v));
    } else {
        arg0->sub->flags |= 0x20000;
        arg0->x8C = 0;
    }
    if ((u32)(arg0->x2D - 0x1D) < 2U) {
        arg0->x36 = 0;
        arg0->flags |= 0x10;
    }
    return 0;
}
