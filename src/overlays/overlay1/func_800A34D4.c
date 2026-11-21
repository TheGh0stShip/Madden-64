#include "types.h"

typedef struct {
    u8 unk_00[0x1C];
    s32 unk_1C;
    s32 unk_20;
    s32 unk_24;
    u8 unk_28[0x4];
    s32 unk_2C;
    s32 unk_30;
    s32 unk_34;
    s16 unk_36;
} Body;

typedef struct {
    u8 unk_00[0x24];
    Body *unk_24;
    u8 unk_28[0x3C];
    u8 unk_64;
    u8 unk_65[0x4B];
} Player;

typedef struct {
    u8 unk_00[0x36];
    s16 unk_36;
} Ball;

s16 func_8009ECA4(void);
void func_800C6330(s32);
void func_800E1BAC(Player *, s8 *);
void func_800E1BCC(Player *, s8 *);
extern s32 D_80080C10;
extern s16 D_80080C14;
extern Body *D_80086178;
extern s16 D_80086E28[3];
extern Player D_80087138[];
extern Ball *D_8008A058;

void func_8009EDB0(void) {
    s8 cmd;
    s32 dx;
    s32 dy;
    s32 dist;
    s32 i;
    s32 best;
    s32 bestDist;
    s32 near;
    s32 nearDist;

    if (func_8009ECA4() != 0) {
        return;
    }
    if (D_8008A058 && !(D_80080C10 & 0x4000)) {
        D_80086178->unk_24 = (D_8008A058->unk_36 / 2) << 16;
        func_800C6330(0);
        D_80080C14 = 0;
        D_80086178->unk_2C = 0;
        D_80086178->unk_30 = 0;
        D_80086178->unk_34 = 0;
        D_80086E28[0] = 0;
        D_80086E28[1] = 0;
        D_80086E28[2] = 0;
    }
    best = -1;
    near = -1;
    bestDist = 0x7FFFFFFF;
    nearDist = 0x7FFFFFFF;
    for (i = 0; i < 4; i++) {
        dx = (D_80087138[i].unk_24->unk_1C - D_80086178->unk_1C) >> 4;
        if (dx < 0) {
            dx = -dx;
        }
        dy = (D_80087138[i].unk_24->unk_20 - D_80086178->unk_20) >> 4;
        if (dy < 0) {
            dy = -dy;
        }
        if (dx < dy) {
            dist = dy + dx / 2;
        } else {
            dist = dx + dy / 2;
        }
        if (D_80087138[i].unk_64 == 0x34) {
            if (dist < bestDist) {
                bestDist = dist;
                best = i;
            }
        }
        if (dist < nearDist) {
            nearDist = dist;
            near = i;
        }
    }
    if (best == -1) {
        cmd = 0x35;
        func_800E1BAC(&D_80087138[near], &cmd);
    } else {
        cmd = 0x35;
        func_800E1BCC(&D_80087138[best], &cmd);
    }
}
