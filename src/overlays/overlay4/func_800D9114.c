#include "types.h"

typedef struct {
    u8 pad[0x1C];
    s32 unk1C;
    s32 unk20;
} Sub;

typedef struct Obj {
    u8 pad[0x24];
    Sub *unk24;
    u8 pad28[0x64 - 0x28];
    u8 unk64;
    u8 pad65[0x9C - 0x65];
    struct Obj *unk9C;
} Obj;

typedef struct {
    Obj *p[22];
} Team;

extern Team D_80085040[];
extern s16 D_800886E0;
extern s16 D_80088AE4;
extern s16 func_800C157C(Obj *);

s32 func_800D9114(u8 arg0, Obj *arg1) {
    s32 near = 0;
    s32 cnt = 0;
    s32 i;
    s32 ax, ay;
    s32 bx, by;
    Team *tbl = D_80085040;
    Obj *t = tbl[D_80088AE4].p[arg0];
    Obj *o;

    for (i = 0; i < 11; i++) {
        o = tbl[D_800886E0].p[i];
        if (o->unk64 == 0x19 && o->unk9C == t) {
            ax = o->unk24->unk1C - t->unk24->unk1C;
            if (ax < 0) {
                ax = -ax;
            }
            ay = o->unk24->unk20 - t->unk24->unk20;
            if (ay < 0) {
                ay = -ay;
            }
            if (ax < ay) {
                ay = ay + ax / 2;
            } else {
                ay = ax + ay / 2;
            }
            if (ay <= 0x1FFFFF) {
                near = 1;
            }
            cnt++;
        }
    }
    if (cnt >= 2) {
        near = 1;
    }
    if (near) {
        return -1;
    }
    if (((func_800C157C(t) + 0x200) & 0xFFF) < 0x400) {
        bx = arg1->unk24->unk1C - t->unk24->unk1C;
        if (bx < 0) {
            bx = -bx;
        }
        by = arg1->unk24->unk20 - t->unk24->unk20;
        if (by < 0) {
            by = -by;
        }
        if (bx < by) {
            by += bx / 2;
        } else {
            by = bx + by / 2;
        }
        return 0xC8 - (by >> 20);
    }
    return -1;
}
