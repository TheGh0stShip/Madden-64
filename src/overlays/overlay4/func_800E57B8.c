#include "types.h"

#ifndef NULL
#define NULL 0
#endif

typedef struct { u8 a, b, c, d; } Msg;
typedef struct { s32 x; s32 y; s32 z; s32 w; } Vec4i;
typedef struct { u8 pad[0x14]; s32 flags; u8 pad18[4]; s32 unk1C; s32 unk20; } Sub;
typedef struct Obj { u8 pad[0x1E]; u8 unk1E; u8 unk1F; u8 pad20[4]; Sub *unk24; u16 unk28; u8 pad2A[6];
    s16 unk30; u8 pad32[4]; s16 unk36; u8 pad38[0x64 - 0x38]; u8 unk64; u8 unk65; u8 unk66; u8 pad67[0x8C - 0x67];
    s32 unk8C; s32 unk90; s32 unk94; struct Obj *unk98; s32 unk9C; s32 unkA0; } Obj;
typedef struct { Obj *p[22]; } Team;
typedef struct { void *fn; Obj *obj; u8 pad08[8]; s16 unk10; } Task;

extern void func_800A365C(s32);
extern void func_800AE924(Task *);
extern s16 func_800B9208(Vec4i *);
extern void func_800B9274(s32, Vec4i *, s32);
extern s16 func_800C157C(Obj *);
extern void func_800E1BCC(Obj *, Msg *);
extern s32 D_80080C10;
extern Team D_80085040[];
extern Obj *D_8008A058;
extern u8 D_800AEFB4[];

s32 func_800E3F18(Obj *arg0) {
    Msg m;
    Vec4i v;
    Task task;
    Obj *o;
    Obj *best;
    s32 i;
    s32 ax, ay;
    s32 bestd;
    s32 ang;
    s32 dist;
    s32 kind;
    Team *tbl;

    arg0->unk24->flags &= ~0x200;
    arg0->unk98 = NULL;
    arg0->unk8C = arg0->unk24->unk1C;
    arg0->unk90 = arg0->unk24->unk20;
    best = NULL;
    arg0->unk94 = -1;
    arg0->unk9C = 0;
    arg0->unkA0 = 0;
    switch (arg0->unk65) {
        case 0:
        case 1:
            arg0->unk94 = 0x2AA;
        case 2:
        case 3:
            ang = -1;
            if (arg0->unk66 == 0) {
                bestd = 0x7FFFFFFF;
                i = 0;
                tbl = D_80085040;
                for (; i < 11; i++) {
                    o = tbl[arg0->unk1E].p[i];
                    if (o == arg0) {
                        continue;
                    }
                    v.x = o->unk24->unk1C - arg0->unk24->unk1C;
                    v.y = o->unk24->unk20 - arg0->unk24->unk20;
                    ax = v.x;
                    if (ax < 0) ax = -ax;
                    ay = v.y;
                    if (ay < 0) ay = -ay;
                    if (ax < ay) {
                        ax = ay + ax / 2;
                    } else {
                        ax = ax + ay / 2;
                    }
                    if (arg0->unk36 == 0) {
                        ax *= 3;
                    }
                    if (o->unk28 & 0x10) {
                        continue;
                    }
                    if (ax < bestd) {
                        best = o;
                        bestd = ax;
                        ang = func_800B9208(&v) & 0xE00;
                    }
                }
                if (best == NULL) {
                    arg0->unk24->flags |= 0x200;
                    return 1;
                }
                arg0->unk94 = ang;
                m.a = 0x33;
                m.b = arg0->unk65;
                m.c = arg0->unk1F + 1;
                m.d = 0;
                func_800E1BCC(best, &m);
                arg0->unk98 = best;
                break;
            }
            best = (&D_80085040[arg0->unk1E])->p[arg0->unk66 - 1];
            dist = 0x150000;
            if (arg0->unk65 != 1) {
                dist = 0xD0000;
            }
            func_800B9274((best->unk94 + arg0->unk94) & 0xFFF, &v, dist);
            arg0->unk8C = best->unk8C + v.x;
            arg0->unk90 = best->unk90 + v.y;
            arg0->unk94 = (best->unk94 + 0x800) & 0xFFF;
            break;
        case 9:
        case 10:
            if (D_8008A058 != NULL) {
                if (D_8008A058->unk64 == 0x1A) {
                    D_8008A058->unk30 = 0x50;
                }
                if (D_8008A058->unk64 == 6) {
                    D_8008A058->unk8C = 0xB4;
                }
                v.x = D_8008A058->unk24->unk1C - arg0->unk24->unk1C;
                v.y = D_8008A058->unk24->unk20 - arg0->unk24->unk20;
                arg0->unk94 = func_800B9208(&v);
            }
            break;
        case 14:
            arg0->unk94 = 0;
            break;
        default:
            arg0->unk94 = func_800C157C(arg0) & 0xE00;
            break;
    }
    if (!(D_80080C10 & 0x4000) && arg0->unk66 == 0) {
        task.fn = D_800AEFB4;
        task.unk10 = 0;
        task.obj = arg0;
        func_800AE924(&task);
        arg0->unkA0 = 1;
    }
    arg0->unk28 |= 0x10;
    func_800A365C(0);
    return 0;
}
