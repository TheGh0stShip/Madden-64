#include "types.h"

typedef struct Sub { u8 pad[0x1C]; s32 x1C; s32 x20; } Sub;
typedef struct Obj { u8 pad0[0x24]; Sub *sub; } Obj;
typedef struct Vec { s32 x; s32 z; s32 pad[2]; } Vec;

s16 func_800B9208(Vec *);
s16 func_800C157C(Obj *);
s32 func_800C16A0(Obj *, s16);
extern Sub *D_80086178;

void func_800D3630(Obj *arg0) {
    Vec v;
    Sub *p = D_80086178;
    s16 a;
    s32 d;

    v.x = p->x1C - arg0->sub->x1C;
    v.z = p->x20 - arg0->sub->x20;
    a = func_800B9208(&v);
    d = a - func_800C157C(arg0);
    d = (d >> 2) + func_800C157C(arg0);
    func_800C16A0(arg0, d);
}
