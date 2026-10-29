#include "types.h"

typedef struct { u8 a, b, c, d; } Msg;
typedef struct { s32 x; s32 y; } Pos2;
typedef struct { s32 x; s32 y; s32 z; s32 w; } Vec4i;
typedef struct { u8 pad[0x1C]; s32 unk1C; s32 unk20; } Sub;
typedef struct Obj { u8 pad[0xE]; u8 unkE; u8 padF[0x1E - 0xF]; u8 unk1E; u8 pad1F[0x24 - 0x1F]; Sub *unk24; u16 unk28;
    u8 pad2A[0x65 - 0x2A]; u8 unk65; u8 unk66; u8 unk67; u8 pad68[0x8C - 0x68];
    s32 unk8C; s32 unk90; s32 unk94; s32 unk98; u8 pad9C[4]; s32 unkA0; } Obj;
typedef struct { Obj *p[22]; } Team;
extern u16 func_80031A1C(s32);
extern s16 func_800B9208(Vec4i *);
extern void func_800B9274(s32, Vec4i *, s32);
extern void func_800C0018(Obj *, s32, s32);
extern void func_800E1A84(Obj *, Msg *);
extern void func_800E1C98(void);
extern s16 D_800894FC;
extern Obj *D_8008A058;
extern u16 D_8008A5B2;
extern Pos2 D_80087A70;
extern Pos2 D_80084F30;
extern s32 D_80080C10;
extern s16 D_800886E0;
extern s8 D_80087A82;
extern s16 D_80089320;
extern s8 D_800894B8[];
extern s8 D_8008B32A;
extern Team D_80085040[];

s32 func_800D9E0C(Obj *a0) {
    Vec4i v;
    Msg m;
    s32 val;
    s32 ang;
    s32 ax, ay;
    s32 c, i;
    Pos2 *p;
    s32 dd;
    Obj *o;

    if (a0->unk28 & 1) {
        goto tail;
    }
    if (D_800894FC != 0) {
        func_800E1C98();
        return 1;
    }
    if (D_8008A058 == a0) {
        m.a = 9;
        m.b = 0;
        m.c = 0;
        func_800E1A84(a0, &m);
        return 0;
    }
    if (D_8008A5B2 == 4 && D_80087A70.x != 0x7FFFFFFF) {
        dd = D_80084F30.y - D_80087A70.y;
        if (dd <= 0x1DFFFFF) {
            return 0;
        }
    }
    if (a0->unk1E == D_800886E0) {
        if (D_8008A058 != 0) {
            if (D_80080C10 & 8) {
                m.a = 0x12;
                func_800E1A84(a0, &m);
                return 1;
            }
        } else if (D_8008A5B2 != 3) {
            goto next;
        }
        if (!(D_80080C10 & 0x100) && func_80031A1C(0x8C) < (u32)(a0->unkE >> 4)) {
            if (D_8008A5B2 != 3) {
                m.a = 0x12;
                func_800E1A84(a0, &m);
                return 1;
            }
            if (D_80080C10 & 8) {
                m.a = 0xC;
                func_800E1A84(a0, &m);
                return 1;
            }
            m.a = 0x12;
            func_800E1A84(a0, &m);
            return 1;
        }
    } else if (D_80080C10 & 1) {
        p = 0;
        if (D_80087A70.x != 0x7FFFFFFF) {
            p = &D_80087A70;
        } else if (D_8008A058 != 0) {
            p = (Pos2 *)&D_8008A058->unk24->unk1C;
        }
        if (p != 0 && a0->unk24->unk20 - 0x500000 < p->y) {
            m.a = 0x11;
            func_800E1A84(a0, &m);
            return 1;
        }
    }
next:
    if (a0->unk98 != (D_80080C10 & 1)) {
        a0->unk8C = -a0->unk8C;
        a0->unk90 = -a0->unk90;
    }
    switch (a0->unk94) {
    case 0:
        if (D_80087A82 == 0) {
            break;
        }
        a0->unk94 = 1;
        if (D_80089320 != -1 && (D_80080C10 & 1)) {
            ang = ((a0->unk66 << 5) + 0x800) & 0xFFF;
        } else {
            ang = a0->unk66 << 5;
        }
        func_800B9274(ang, &v, a0->unk65 << 18);
        a0->unk8C = v.x + a0->unk24->unk1C;
        a0->unk90 = v.y + a0->unk24->unk20;
        if (a0->unk8C < (s32)0xFE700000) {
            a0->unk8C = (s32)0xFE700000 - a0->unk24->unk1C;
        }
        if (a0->unk8C > 0x1900000) {
            a0->unk8C = 0x1900000 - a0->unk24->unk1C;
        }
        if (a0->unk90 > 0x3900000) {
            a0->unk90 = 0x3900000;
        }
        if (a0->unk90 < (s32)0xFC400000) {
            a0->unk90 = (s32)0xFC400000;
        }
        break;
    case 1:
        v.x = a0->unk8C - a0->unk24->unk1C;
        v.y = a0->unk90 - a0->unk24->unk20;
        ax = v.x;
        if (ax < 0) ax = -ax;
        ay = v.y;
        if (ay < 0) ay = -ay;
        if (ax < ay) {
            ax = ay + ax / 2;
        } else {
            ax = ax + ay / 2;
        }
        if (ax <= 0xAAAA9) {
            a0->unk94 = 2;
            a0->unkA0 = -1;
        } else {
            a0->unkA0 = func_800B9208(&v);
        }
        break;
    case 2:
        c = a0->unk67;
        if (c == 0xFF) {
            m.a = 0x11;
            func_800E1A84(a0, &m);
            return 1;
        }
        if (c == 0xA) {
            a0->unk94 = 4;
            break;
        }
        for (i = 0; i < 10; i++) {
            if (D_800894B8[i] == c + 1) {
                break;
            }
        }
        m.a = 0x11;
        m.b = m.c = m.d = i;
        func_800E1A84(a0, &m);
        return 1;
    case 3:
        break;
    case 4:
        a0->unkA0 = 0;
        if (D_8008A058 != 0) {
            ax = a0->unk24->unk20 - D_8008A058->unk24->unk20;
            if (ax > 0x700000) {
                if (ax > 0xE00000) {
                    a0->unkA0 = 0x800;
                } else {
                    a0->unkA0 = -1;
                }
            }
        } else if (D_80087A70.x != 0x7FFFFFFF) {
            ay = a0->unk24->unk20;
            dd = ay - D_80087A70.y;
            if (dd > 0) {
                dd = D_80084F30.y - ay;
                if (dd > 0x2800000) {
                    a0->unkA0 = -1;
                }
            }
        }
        o = D_80085040[a0->unk1E ^ 1].p[D_8008B32A];
        if (o->unk24->unk20 < a0->unk24->unk20 + 0x400000) {
            m.a = 0x11;
            func_800E1A84(a0, &m);
            return 1;
        }
        break;
    }
    if (a0->unkA0 >= 0) {
        func_800C0018(a0, (s16)a0->unkA0, 0);
    }
tail:
    a0->unk98 = D_80080C10 & 1;
    return 0;
}
