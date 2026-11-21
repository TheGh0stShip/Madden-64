#include "types.h"

typedef struct {
    u8 unk_00[0x1C];
    s32 unk_1C;
    s32 unk_20;
    u8 unk_24[0x8];
    s32 unk_2C;
    s32 unk_30;
} Body;

typedef struct {
    u8 unk_00[0x24];
    Body *unk_24;
    u8 unk_28[0xE];
    s16 unk_36;
} Player;

typedef struct {
    Player *players[22];
} Team;

void func_800E1C98(Player *);
void func_800E1A84(Player *, u8 *);
void func_800E1B00(Player *, u8 *);
extern Player *D_8008A058;
extern u32 D_80080C10;
extern u16 D_8008B672;
extern s16 D_80088AE4;
extern Player *D_80085040[][22];

s32 func_800BB7E4(Player *arg0) {
    u8 buf[4];
    Player *p;
    Body *b;
    s16 i;
    s16 best;
    u32 bestDist;
    s32 x;
    s32 y;
    s32 dx;
    s32 dy;
    s32 adx;

    if (D_8008A058 != arg0 || !(D_80080C10 & 0x4000)) {
        return 0;
    }
    bestDist = -1;
    best = -1;
    for (i = 0; i < D_8008B672 / 2; i++) {
        p = D_80085040[D_80088AE4][i];
        if (p == arg0 || p->unk_36 == 0) {
            continue;
        }
        b = p->unk_24;
        x = b->unk_1C;
        if ((x < 0 ? -x : x) > 0x17FFFFF) {
            continue;
        }
        y = b->unk_20;
        if (y <= (s32)0xFC500000) {
            continue;
        }
        dx = (y - arg0->unk_24->unk_20) + b->unk_30 * 20;
        if (dx > 0) {
            continue;
        }
        dy = (x - arg0->unk_24->unk_1C) + b->unk_2C * 16;
        if (dy < 0) {
            dy = -dy;
        }
        adx = dx < 0 ? -dx : dx;
        if (dy < adx) {
            dx = adx + dy / 2;
        } else {
            dx = dy + adx / 2;
        }
        if ((u32)dx < bestDist) {
            bestDist = dx;
            best = i;
        }
    }
    if (best != -1 && bestDist <= 0x5FFFFF) {
        func_800E1C98(arg0);
        buf[0] = 0xB;
        buf[1] = best - 0x80;
        buf[2] = 0;
        func_800E1A84(arg0, buf);
        buf[0] = 0x11;
        func_800E1B00(arg0, buf);
        return 1;
    }
    return 0;
}
