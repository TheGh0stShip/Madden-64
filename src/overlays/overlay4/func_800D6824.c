#include "types.h"

typedef struct Sub { u8 pad[0x1C]; s32 x1C; s32 x20; } Sub;
typedef struct Obj Obj;
struct Obj {
    u8 pad0[0x13]; u8 x13; u8 pad0b[0x18 - 0x14]; u8 x18; u8 pad1[0x20 - 0x19]; u8 x20; u8 x21;
    u8 pad2[0x24 - 0x22]; Sub *sub; u8 pad3[0x36 - 0x28]; s16 x36; u8 pad4[0x40 - 0x38];
    Obj *x40; s32 x44;
};
typedef struct Team { Obj *players[22]; } Team;
typedef struct Vec { s32 x; s32 z; s32 pad[2]; } Vec;

s16 func_800B9208(Vec *);
extern s32 D_80080C10;
extern Team D_80085040[];
extern s16 D_800886E0;

Obj *func_800D6824(Obj *arg0) {
    Vec v;
    Obj *best = 0;
    s32 bestScore = -1;
    s32 i;
    Obj *p;
    s32 dx, a, d;

    if (!(D_80080C10 & 0x100) && (u32)(arg0->x20 - 6) < 3U)
    for (i = 0; i < 11; i++) {
        p = (D_80085040 + D_800886E0)->players[i];
        if (p->x36 == 0) {
            continue;
        }
        if (p->x40 == 0) {
            continue;
        }
        if (p->x44 != 0) {
            continue;
        }
        if (p->sub->x20 >= arg0->sub->x20 + 0x200000) {
            continue;
        }
        if (p->sub->x20 < arg0->sub->x20 - 0x80000) {
            continue;
        }
        dx = p->sub->x1C - arg0->sub->x1C;
        if ((dx < 0 ? -dx : dx) > 0x1FFFFF) {
            continue;
        }
        v.x = p->x40->sub->x1C - p->sub->x1C;
        v.z = p->x40->sub->x20 - p->sub->x20;
        a = func_800B9208(&v);
        v.x = arg0->sub->x1C - p->sub->x1C;
        v.z = arg0->sub->x20 - p->sub->x20;
        d = func_800B9208(&v) - a;
        if ((d & 0xFFF) > 0x800) {
            d = 0xFFF - d;
        }
        d += p->x18 - p->x40->x13;
        if ((p->x21 & 0xC0) == 0x40) {
            d += 0x88;
        }
        if (d >= 0xAB) {
            if (bestScore < d) {
                best = p;
                bestScore = d;
            }
        }
    }
    return best;
}
