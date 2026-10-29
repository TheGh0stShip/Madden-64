#include "types.h"

typedef struct Sub { u8 pad[0x1C]; s32 x1C; s32 x20; } Sub;
typedef struct Obj { u8 pad0[0x24]; Sub *sub; u8 pad1[0x9C - 0x28]; s32 x9C; s32 xA0; } Obj;
typedef struct Team { Obj *players[22]; } Team;
typedef struct Vec { s32 x; s32 z; s32 pad[2]; } Vec;

s16 func_800B9208(Vec *);
s16 func_800C157C(Obj *);
extern s32 D_80080C10;
extern Team D_80085040[];
extern s32 D_80087A70;
extern s32 D_80087A74;
extern s16 D_800886E0;
extern Obj *D_8008A058;
extern u16 D_8008A5B2;
extern s8 D_8008B324;

void func_800D65BC(Obj *arg0) {
    Vec v;
    Vec w;
    s16 a;
    s32 d;

    if (D_8008A058 != 0) {
        if (D_8008A058->sub->x1C < arg0->sub->x1C) {
            v.x = D_8008A058->sub->x1C + 0x300000;
        } else {
            v.x = D_8008A058->sub->x1C - 0x300000;
        }
        if (v.x < -0x01700000) {
            v.x = -0x01700000;
        }
        if (v.x > 0x01700000) {
            v.x = 0x01700000;
        }
        if ((D_80085040 + D_800886E0)->players[D_8008B324]->sub->x20 < D_8008A058->sub->x20) {
            v.z = D_8008A058->sub->x20 - 0x200000;
        } else {
            v.z = D_8008A058->sub->x20 + 0x500000;
            if (((func_800C157C(D_8008A058) + 0x200) & 0xFFF) < 0x400) {
                v.z += 0x300000;
            }
        }
        v.x -= arg0->sub->x1C;
        v.z -= arg0->sub->x20;
        a = func_800B9208(&v);
        arg0->xA0 = a;
        if (arg0->sub->x20 < D_8008A058->sub->x20 ||
            (d = D_8008A058->sub->x1C - arg0->sub->x1C, (d < 0 ? -d : d) > 0x800000)) {
            if (a < 0x800) {
                arg0->xA0 = a / 2;
            } else {
                arg0->xA0 = 0xFFF - (0xFFF - a) / 2;
            }
            arg0->x9C = 0x9999;
            return;
        }
        arg0->x9C = -1;
        return;
    }
    arg0->xA0 = -1;
    arg0->x9C = -1;
    if (D_8008A5B2 == 5 && D_80087A70 != 0x7FFFFFFF) {
        w.x = D_80087A70 - arg0->sub->x1C;
        w.z = D_80087A74 - arg0->sub->x20;
        w.z += (D_80080C10 & 1) << 22;
        arg0->xA0 = func_800B9208(&w);
    }
}
