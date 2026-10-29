#include "types.h"

typedef struct Sub { u8 pad[0x14]; s32 flags; u8 pad1[0x1C - 0x18]; s32 x1C; s32 x20; u8 pad2[0x2C - 0x24]; s32 x2C; s32 x30; } Sub;
typedef struct Obj {
    u8 pad0[0x1B]; u8 x1B; u8 pad0b[0x1E - 0x1C]; u8 x1E; u8 pad0c[0x24 - 0x1F]; Sub *sub;
    u8 pad2[0x65 - 0x28]; u8 x65; u8 pad3[0x8C - 0x66]; s32 x8C; s32 x90; u8 pad4[0x9C - 0x94]; s32 x9C;
} Obj;
typedef struct Vec { s32 x; s32 z; s32 pad[2]; } Vec;
typedef struct Team { Obj *players[22]; } Team;

s16 func_800B9208(Vec *);
s32 func_800C0BBC(Obj *, s32);
s32 func_800C16A0(Obj *, s16);
extern Team D_80085040[];

s32 func_800D0F14(Obj *arg0) {
    Vec v;
    s16 angle;
    s32 anim;
    s32 idx;
    Sub *s;
    Obj *o;

    idx = arg0->x65;
    arg0->x8C = -1;
    arg0->x9C = 8;
    anim = 0x7000E;
    if (idx == 0xFF) {
        angle = ((arg0->sub->x1C >> 31) & 0xDFF) | 0x1FF;
    } else {
        angle = 0;
        if (idx != 0xFE) {
            o = (D_80085040 + arg0->x1E)->players[idx];
            v.x = o->sub->x1C - arg0->sub->x1C;
            v.z = o->sub->x20 - arg0->sub->x20;
            if ((u32)(v.x + 0xA0) >= 0x141U || (u32)(v.z + 0xA0) >= 0x141U) {
                anim = 0x7000D;
            }
            angle = func_800B9208(&v);
        }
    }
    if (arg0->x1B == 0) {
        if (anim == 0x7000E) {
            anim = 0x70010;
        } else {
            anim = 0x7000F;
        }
    }
    s = arg0->sub;
    s->x30 = 0;
    s->x2C = 0;
    func_800C16A0(arg0, angle);
    arg0->x90 = angle;
    func_800C0BBC(arg0, anim);
    arg0->sub->flags |= 0x10000;
    return 0;
}
