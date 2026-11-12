#include "types.h"

typedef struct {
    u8 pad0[0x2C];
    s32 unk2C;
    s32 unk30;
    s32 unk34;
} S6178;

typedef struct {
    s16 x;
    s16 y;
} Vec2s;

extern s32 func_8002E890(s32, s32);
extern s16 func_800B9208(void *);
extern u16 D_80080C14;
extern s16 D_80085A38;
extern s16 D_80085A3A;
extern S6178 *D_80086178;
extern s16 D_800861B0;
extern s16 D_80086CC0[2];
extern s16 D_80086DD0[2];
extern s16 D_80086E28[3];
extern s16 D_800876E0;
extern s16 D_800876E2;

void func_800C98F8(void) {
    Vec2s rot;
    s16 ox;
    s16 oy;
    s16 a;
    s16 *r;
    s16 *q;
    s32 ax;
    s32 ay;
    s32 d;
    s32 t;

    ax = D_80086178->unk2C;
    ax++;
    ax--;
    D_80080C14 = (D_80080C14 & 0xFFFC) | 4;
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
    rot.x = 0x600 - func_8002E890(D_80086178->unk34, d) / 2;
    a = func_800B9208(&D_80086178->unk2C);
    do {
        r = &D_80085A38;
        ox = *r;
        oy = D_80085A3A;
    } while (0);
    rot.y = -a + 0x400;
    t = d >> 7;
    *r = 0x400;
    D_80086CC0[0] = *r - t;
    D_80086CC0[1] = rot.y - t;
    D_80086DD0[0] = t + 0x400;
    D_80085A3A = rot.y;
    D_80086DD0[1] = rot.y + t;
    D_800861B0 = t;
    D_80086E28[0] = (s16)t >> 3;
    D_80086E28[1] = (s16)t >> 3;
    D_80086E28[2] = -(d >> 10);
    q = &D_800876E0;
    *q = rot.x + (*q - ox);
    D_800876E2 = rot.y + (D_800876E2 - oy);
}
