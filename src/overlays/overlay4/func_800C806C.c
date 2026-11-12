#include "types.h"

typedef struct {
    u8 pad0[0x2C];
    s32 unk2C;
    s32 unk30;
    s32 unk34;
} S6178;

extern s32 func_8002E890(s32, s32);
extern s16 func_800B9208(void *);
extern u16 D_80080C14;
extern s16 D_80085A38;
extern s16 D_80085A3A;
extern S6178 *D_80086178;
extern s16 D_800861B0;
extern s16 D_80086CC0;
extern s16 D_80086CC2;
extern s16 D_80086CC4;
extern s16 D_80086DD0;
extern s16 D_80086DD2;
extern s16 D_80086DD4;
extern s16 D_80086E28;
extern s16 D_80086E2A;
extern s16 D_80086E2C;
extern s16 D_800876E0;
extern s16 D_800876E2;

void func_800C806C(s16 arg0, s16 arg1) {
    s32 ax;
    s32 ay;
    s32 d;
    s16 *q;
    s16 t;
    s16 tmp;
    s16 e0;
    S6178 *state;

    D_80080C14 = (D_80080C14 & 0xFFF9) | 1;
    D_80086CC4 = 0;
    D_80086DD4 = 0;
    D_80086E2C = arg0;
    ax = D_80086178->unk2C;
    if (ax < 0) {
        ax = -ax;
    }
    ay = D_80086178->unk30;
    if (ay < 0) {
        ay = -ay;
    }
    if (ax < ay) {
        d = ay + ax / 2;
    } else {
        d = ax + ay / 2;
    }
    q = &D_800876E0;
    D_80085A38 = *q = 0x800 - func_8002E890(D_80086178->unk34, d);
    state = D_80086178;
    do {
        D_80085A3A = D_800876E2 = t = -func_800B9208(&state->unk2C);
    } while (0);
    e0 = *q;
    tmp = (u16)arg1 >> 2;
    D_80086E28 = tmp;
    D_80086E2A = tmp;
    do {
        D_80086CC2 = t - arg1;
        D_80086DD2 = t + arg1;
    } while (0);
    D_800861B0 = arg1;
    D_80086CC0 = e0 - arg1;
    D_80086DD0 = e0 + arg1;
}
