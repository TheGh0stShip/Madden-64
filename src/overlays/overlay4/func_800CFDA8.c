#include "types.h"

typedef struct Sub {
    u8 pad[0x1C];
    s32 x1C;
    s32 x20;
} Sub;

typedef struct Slot {
    u8 a;
    u8 b;
    u8 c;
    u8 d;
} Slot;

typedef struct Obj {
    u8 pad0[0x24];
    Sub *sub;
    u16 flags;
    u8 pad2[0x64 - 0x2A];
    Slot slots[10];
    s32 x8C;
    s32 x90;
    s32 x94;
    s32 x98;
    s32 x9C;
    s32 xA0;
} Obj;

typedef struct Vec {
    s32 x;
    s32 z;
    s32 pad[2];
} Vec;

typedef struct Msg {
    s8 a;
    u8 b;
    u8 c;
} Msg;

void func_800B9274(s16, Vec *, s32);
s32 func_800E1A84(Obj *, Msg *);
s32 func_800E1C98(Obj *);
extern s32 D_80080C10;
extern s16 D_80089320;
extern s16 D_800894FC;

s32 func_800CFDA8(Obj *arg0) {
    Vec v;
    Msg m;
    s32 i;

    for (i = 0; i < 10; i++) {
        if (arg0->slots[i].a == 1) {
            break;
        }
        if (arg0->slots[i].a == 0xF) {
            m.a = 0x1D;
            m.b = arg0->slots[0].b;
            m.c = arg0->slots[0].c;
            func_800E1A84(arg0, &m);
            return 0;
        }
    }
    if (D_80089320 != -1) {
        arg0->x94 = D_80080C10 & 1;
    } else {
        arg0->x94 = 1;
    }
    arg0->x9C = arg0->slots[0].c << 5;
    if ((D_80080C10 & 1) && D_80089320 != -1) {
        arg0->x9C = (arg0->x9C + 0x800) & 0xFFF;
    }
    func_800B9274(arg0->x9C, &v, arg0->slots[0].b << 18);
    arg0->x8C = v.x + arg0->sub->x1C;
    if ((u32)(arg0->x8C + 0x01900000) > 0x03200000U) {
        arg0->x8C = (v.x - v.x / 3) + arg0->sub->x1C;
    }
    arg0->x90 = v.z + arg0->sub->x20;
    if (arg0->x90 > 0x03900000) {
        arg0->x90 = 0x03900000;
    }
    if (arg0->x90 < -0x03A80000) {
        arg0->x90 = -0x03A80000;
    }
    if (arg0->flags & 1) {
        return 0;
    }
    if (D_800894FC == 0) {
        arg0->xA0 = 0;
        return 0;
    }
    func_800E1C98(arg0);
    return 1;
}
