#include "types.h"

typedef struct Obj {
    u8 pad0[0xE]; u8 xE; u8 pad1[0x14 - 0xF]; u8 x14; u8 pad2[0x28 - 0x15]; u16 flags;
    u8 pad3[0x40 - 0x2A]; s32 x40; u8 pad4[0x48 - 0x44]; s16 x48;
    u8 pad5[0x98 - 0x4A]; s32 x98; s32 x9C; s32 xA0;
} Obj;
typedef struct Msg { s8 a; s8 b; s8 c; } Msg;

s32 func_800C0018(Obj *, s16, s32);
s32 func_800C058C(Obj *, s16, s16, s32);
s16 func_800C0EE0(Obj *);
s16 func_800CC238(Obj *);
s32 func_800CC5C4(Obj *, s16);
s32 func_800CC61C(Obj *);
s32 func_800D4A74(Obj *);
s32 func_800D4D1C(Obj *);
s32 func_800E1A84(Obj *, Msg *);
s32 func_800E1C98(Obj *);
extern s16 D_800894FC;
extern Obj *D_8008A058;
extern volatile u16 D_8008A5B4;

s32 func_800D1AB8(Obj *arg0) {
    Msg m;
    s16 r;

    if (arg0 == D_8008A058) {
        func_800CC61C(arg0);
        m.a = 9;
        m.b = 0;
        m.c = 0;
        func_800E1A84(arg0, &m);
        return 1;
    }
    if (arg0->flags & 1) {
        return 0;
    }
    if (D_800894FC != 0) {
        func_800E1C98(arg0);
        return 1;
    }
    if (func_800C0EE0(arg0) == 1) {
        func_800CC61C(arg0);
        return 0;
    }
    if (!(arg0->flags & 8)) {
        m.a = 0x12;
        func_800E1A84(arg0, &m);
        return 1;
    }
    if (arg0->x48 != 0) {
        return 0;
    }
    r = 0;
    if (arg0->x40 != 0) {
        r = func_800CC238(arg0);
    }
    if (r != 0) {
        func_800CC5C4(arg0, r);
        return 0;
    }
    arg0->x98 -= D_8008A5B4;
    if (arg0->x98 < 0) {
        arg0->x98 = ((0xFF - ((arg0->x14 + arg0->xE) >> 1)) >> 5) + 2;
        if (arg0->x40 != 0) {
            func_800D4A74(arg0);
            arg0->x9C = -1;
        } else {
            func_800D4D1C(arg0);
        }
    }
    if (arg0->xA0 >= 0) {
        s32 v = arg0->x9C;
        if (v == -1) {
            func_800C0018(arg0, arg0->xA0, 0);
            return 0;
        }
        func_800C058C(arg0, arg0->xA0, arg0->xA0, v);
    }
    return 0;
}
