#include "types.h"

typedef struct {
    u8 pad0[0x2C];
    s32 unk2C;
} S6178;

typedef struct {
    s16 v;
} Cell;

extern s16 func_800B9208(void *);
extern u16 D_80080C14;
extern s16 D_80085A38;
extern s16 D_80085A3A;
extern S6178 *D_80086178;
extern s16 D_800861B0;
extern Cell D_80086CC4;
extern Cell D_80086DD4;
extern Cell D_80086E2C;
extern s16 D_800876E0;
extern s16 D_800876E2;

void func_800C81C0(void) {
    Cell *a = &D_80086CC4;
    Cell *b = &D_80086DD4;
    Cell *c = &D_80086E2C;
    s16 t;
    s32 z = 0;
    S6178 *obj = D_80086178;

    a->v = 0;
    b->v = 0;
    c->v = 0x51;
    D_80080C14 = (D_80080C14 & 0xFFFA) | 2;
    if (D_80080C14 & 8) {
        D_800876E0 = 0;
        D_80085A38 = 0;
        t = -func_800B9208(&obj->unk2C);
        D_800876E2 = t;
        D_80085A3A = t;
        if (z) { while (D_80085A38) { D_800861B0++; } }
        c[-2].v = 0xA3;
        c[-1].v = 0;
        a[-2].v = 0;
        a[-1].v = 0;
        b[-2].v = 0;
        b[-1].v = 0;
        D_800861B0 = 0;
    } else {
        D_800876E0 = 0;
        D_80085A38 = 0;
        t = -func_800B9208(&obj->unk2C);
        D_800876E2 = t;
        D_80085A3A = t;
        if (z) { while (D_80085A38) { D_800861B0++; } }
        c[-2].v = 0xA3;
        c[-1].v = 0;
        a[-2].v = 0;
        a[-1].v = 0;
        b[-2].v = 0;
        b[-1].v = 0;
        D_800861B0 = 0;
    }
}
