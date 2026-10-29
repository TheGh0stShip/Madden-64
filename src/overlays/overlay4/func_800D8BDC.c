#include "types.h"

typedef struct { u8 a, b, c, d; } Msg;
typedef struct { s32 x; s32 y; } Pos2;
typedef struct { s32 x; s32 y; s32 z; s32 w; } Vec4i;
typedef struct { u8 pad[0x1C]; s32 unk1C; s32 unk20; } Sub;
typedef struct Obj { u8 pad[0xE]; u8 unkE; u8 padF[0x1F-0xF]; u8 unk1F; u8 pad20[4]; Sub *unk24; u16 unk28; u8 pad2A[0x40-0x2A];
    struct Obj *unk40; u8 pad44[0x4A-0x44]; s16 unk4A; u8 pad4C[0x65-0x4C]; u8 unk65; u8 pad66[0x8C-0x66];
    s32 unk8C; s32 unk90; s32 unk94; s32 unk98; } Obj;
typedef struct { Obj *p[22]; } Team;
extern u16 func_80031A1C(s32);
extern s16 func_800B9208(Vec4i *);
extern void func_800C0018(Obj *, s32, s32);
extern s16 func_800C0EE0(Obj *);
extern s16 func_800C157C(Obj *);
extern s16 func_800C1608(Obj *);
extern void func_800E1A84(Obj *, Msg *);
extern void func_800E1BAC(Obj *, Msg *);
extern void func_800E1C98(void);
extern Pos2 D_80084F30;
extern Team D_80085040[];
extern Sub *D_80086178;
extern s16 D_80088AE4;
extern s16 D_800894FC;
extern Obj *D_8008A058;
extern u16 D_8008A5B2;

s32 func_800D8BDC(Obj *arg0) {
    Msg m;
    Vec4i v;
    Vec4i w;
    s32 flag;
    s16 ang;
    s16 a2;
    s32 i;
    s32 ax, ay;
    Obj *o;
    Team *tbl;
    s32 d;

    if (arg0->unk28 & 1) {
        return 0;
    }
    flag = 0;
    if (D_800894FC != 0) {
        func_800E1C98();
        return 1;
    }
    m.a = 0x12;
    if (func_800C0EE0(arg0) == 1) {
        func_800E1BAC(arg0, &m);
        return 0;
    }
    if (D_8008A058 != 0) {
        if (D_8008A058->unk1F == 0) {
            d = D_80086178->unk1C - D_80084F30.x;
            if (d < 0) d = -d;
            if (d <= 0x500000) {
                goto check;
            }
            goto send;
        }
    } else if (D_8008A5B2 == 3) {
        goto check;
    }
    flag = 1;
check:
    if ((flag && (u32)(arg0->unkE >> 4) > func_80031A1C(200)
         && ((D_80084F30.x - arg0->unk24->unk1C) ^ (D_80084F30.x - D_80086178->unk1C)) >= 0)
        || arg0->unk24->unk20 < D_80084F30.y - 0x200000) {
    send:
        func_800E1A84(arg0, &m);
        return 1;
    }
    v.x = arg0->unk8C - arg0->unk24->unk1C;
    v.y = arg0->unk90 - arg0->unk24->unk20;
    ang = func_800B9208(&v);
    if (((func_800C1608(arg0) - 3) & 7) < 3 && arg0->unk4A >= 0x1A && func_80031A1C(0x96) < arg0->unkE) {
        d = arg0->unk24->unk1C - D_80084F30.x;
        if (d < 0) d = -d;
        if (d > 0x200000) {
            i = 0;
            tbl = D_80085040;
            for (; i < 11; i++) {
                o = tbl[D_80088AE4].p[i];
                if (o->unk40 != arg0) {
                    continue;
                }
                w.x = o->unk24->unk1C - arg0->unk24->unk1C;
                w.y = tbl[D_80088AE4].p[i]->unk24->unk20 - arg0->unk24->unk20;
                a2 = func_800B9208(&w);
                if (((a2 - func_800C157C(arg0) + 0x38) & 0xFFF) < 0x72) {
                    continue;
                }
                ax = w.x;
                if (ax < 0) ax = -ax;
                ay = w.y;
                if (ay < 0) ay = -ay;
                if (ax < ay) {
                    ay = ay + ax / 2;
                } else {
                    ay = ax + ay / 2;
                }
                if (ay > 0x1FFFFF) {
                    continue;
                }
                if (w.y >= 0) {
                    continue;
                }
                ax = v.x;
                if (ax < 0) ax = -ax;
                ay = v.y;
                if (ay < 0) ay = -ay;
                if (ax < ay) {
                    ay = ay + ax / 2;
                } else {
                    ay = ax + ay / 2;
                }
                arg0->unk65 = ay >> 18;
                m.a = 0x30;
                m.b = func_800C157C(arg0) >> 4;
                func_800E1A84(arg0, &m);
                return 0;
            }
        }
    }
    ax = arg0->unk94 - arg0->unk24->unk1C;
    if (ax < 0) ax = -ax;
    ay = arg0->unk98 - arg0->unk24->unk20;
    if (ay < 0) ay = -ay;
    if (ax < ay) {
        ay = ay + ax / 2;
    } else {
        ay = ax + ay / 2;
    }
    if ((arg0->unk65 << 18) >= ay) {
        func_800C0018(arg0, ang, 0);
        return 0;
    }
    return 1;
}
