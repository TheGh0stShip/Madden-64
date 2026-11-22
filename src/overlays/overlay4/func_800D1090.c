#include "types.h"

typedef struct Sub {
    u8 pad[0x14];
    s32 flags;
    u8 pad1[0x1C - 0x18];
    s32 x1C;
    s32 x20;
} Sub;

typedef struct Obj Obj;
struct Obj {
    u8 pad0[0x1E];
    u8 x1E;
    u8 x1F;
    u8 pad0b[0x24 - 0x20];
    Sub *sub;
    u16 flags;
    u8 pad1[0x30 - 0x2A];
    s16 x30;
    u8 pad2[0x38 - 0x32];
    Obj *x38;
    u8 pad3[0x65 - 0x3C];
    u8 x65;
    u8 pad4[0x8C - 0x66];
    s32 x8C;
    s32 x90;
};

typedef struct Team {
    Obj *players[22];
} Team;

typedef struct Msg {
    s8 a;
    s8 b;
    s8 c;
} Msg;

typedef struct Event {
    s8 type;
    s8 pad;
    s16 x;
    s16 z;
    u8 pad2[6];
    Obj *obj;
} Event;

s32 func_80025794(s32, s32, s32, s32);
s32 func_800280B0(u8, s32, s32);
s32 func_8003EE10(Obj *);
s32 func_800BC98C(void);
s32 func_800C0BBC(Obj *, s32);
s32 func_800C11EC(Obj *, s32);
s32 func_800C16A0(Obj *, s16);
s32 func_800C5F80(void);
s32 func_800D3EB8(Obj *, Obj *);
s32 func_800E1A84(Obj *, Msg *);
s32 func_800E1B00(Obj *, Msg *);
s32 func_800E1C98(Obj *);
extern s32 D_80080C10;
extern s32 D_80084F34;
extern Team D_80085040[];
extern Sub *D_80086178;
extern s32 D_80087A70;
extern s32 D_80087A74;
extern Event D_80087AB0;
extern s16 D_800886E0;
extern s16 D_80089512;
extern Obj *D_8008A058;
extern s32 D_8008A3DC;
extern u16 D_8008A5B4;

s32 func_800D1090(Obj *arg0) {
    Msg m;
    Event *ev;
    s32 best, i, dx, dz, d;
    Obj *bp, *p;
    Sub *s, *ps, *fs;
    s32 idx;
    s32 bx, dt, t0;

    if (D_8008A058 != arg0) {
        if (arg0->x30 >= 0x14) {
            func_800E1C98(arg0);
            m.a = 0x1A;
            func_800E1A84(arg0, &m);
            m.a = 0x11;
            func_800E1B00(arg0, &m);
            arg0->x30 += 0x1E;
            func_8003EE10(arg0);
            if (arg0->x38 != 0) {
                func_80025794(arg0->x38->x1E, arg0->x38->x1F, 0x13, 1);
            }
            func_800C11EC(arg0, 0x1E);
            func_800BC98C();
            return 1;
        }
        fs = arg0->sub;
        if (fs->flags & 0x20000) {
            return 0;
        }
        best = 0x7FFFFFFF;
        bp = 0;
        fs->flags &= ~0x10000;
        func_800C0BBC(arg0, 0x2E0003);
        if (!(D_80080C10 & 1)) {
            s = arg0->sub;
            for (i = 0; i < 11; i++) {
                p = (D_80085040 + D_800886E0)->players[i];
                ps = p->sub;
                dx = s->x1C - ps->x1C;
                if (dx < 0) {
                    dx = -dx;
                }
                dz = s->x20 - ps->x20;
                if (dz < 0) {
                    dz = -dz;
                }
                if (dx < dz) {
                    d = dz + dx / 2;
                } else {
                    d = dx + dz / 2;
                }
                if (d < best) {
                    best = d;
                    bp = p;
                }
            }
            if (best < 0x300000) {
                func_80025794((u16)D_800886E0, bp->x1F, 0x12, 1);
            }
        }
        arg0->flags &= ~1;
        func_800E1C98(arg0);
        m.a = 0x26;
        m.b = 0;
        m.c = 0x14;
        func_800E1A84(arg0, &m);
        func_800BC98C();
        return 1;
    }
    func_800C16A0(arg0, arg0->x90);
    t0 = arg0->x8C;
    dt = D_8008A5B4;
    D_8008A3DC = 0;
    if (t0 < 0) {
        arg0->x8C = t0 - dt;
    }
    if (arg0->sub->flags & 0x40000) {
        if (!(D_80080C10 & 0x10)) {
            arg0->x8C = D_80089512;
        } else {
            arg0->x8C /= 2;
        }
        if (arg0->x8C < 0) {
            arg0->x8C = -arg0->x8C;
        }
        if (arg0->x8C >= 0xC) {
            arg0->x8C = 0xB;
        }
        idx = arg0->x65;
        arg0->x8C += 0x12;
        if (idx == 0xFF) {
            func_800D3EB8(arg0, 0);
        } else if (idx == 0xFE) {
            func_800D3EB8(arg0, (Obj *)1);
        } else {
            u8 t;
            u8 k;

            func_800D3EB8(arg0, (D_80085040 + arg0->x1E)->players[idx]);
            t = (-((D_80087A74 - D_80084F34) < 0xA00000)) & 3;
            bx = D_80087A70;
            if (bx > 0x57FFFF) {
                k = t + 2;
            } else if (bx < -0x580000) {
                k = t;
            } else {
                k = t + 1;
            }
            func_800280B0(arg0->x1E, k, bx);
        }
        func_800BC98C();
        ev = &D_80087AB0;
        ev->type = 5;
        ev->x = D_80086178->x1C >> 16;
        ev->z = D_80086178->x20 >> 16;
        ev->obj = arg0;
        func_800C5F80();
    }
    return 0;
}
