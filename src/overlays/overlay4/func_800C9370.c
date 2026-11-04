#include "types.h"

typedef struct { u8 pad0[0x2C]; s32 unk2C; s32 unk30; s32 unk34; } S6178;
typedef struct { s16 x; s16 y; } Vec2s;
extern s32 func_8002E890(s32, s32);
extern s16 func_800B9208(void *);
extern s16 D_80085A38;
extern s16 D_80085A3A;
extern S6178 *D_80086178;
extern const s16 D_800861B0;
extern s16 D_80086CC0[2];
extern s16 D_80086DD0[2];
extern s16 D_800876E0;
extern s16 D_800876E2;

void func_800C9370(void) {
    Vec2s rot;
    s16 *q;
    s16 *r;
    s16 oy;
    s32 ax, ay, d;
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
    rot.x = 0x600 - func_8002E890(D_80086178->unk34, d) / 2;
    rot.y = -func_800B9208(&D_80086178->unk2C);
    oy = D_80085A3A;
    D_80085A3A = rot.y;
    q = &D_800876E0;
    r = &D_80085A38;
    *q = rot.x + (*q - *r);
    D_800876E2 = rot.y + (D_800876E2 - oy);
    *r = rot.x;
    D_80086CC0[0] = rot.x - D_800861B0;
    D_80086CC0[1] = rot.y - D_800861B0;
    D_80086DD0[0] = rot.x + D_800861B0;
    D_80086DD0[1] = rot.y + D_800861B0;
}
