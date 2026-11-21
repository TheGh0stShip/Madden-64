#include "types.h"

typedef struct {
    u8 pad00[0x8];
    struct Body2 *unk_08;
    u8 pad0C[0x14 - 0xC];
    s32 unk_14;
    s32 unk_18;
    s32 unk_1C;
    s32 unk_20;
    s32 unk_24;
} Body;

typedef struct Body2 {
    u8 pad00[0x12];
    s16 unk_12;
} Body2;

typedef struct {
    u8 pad00[0x24];
    Body *unk_24;
    u8 pad28[0xB0 - 0x28];
} Player;

typedef struct {
    s32 x;
    s32 y;
    s32 z;
    u8 pad0C[0x10 - 0xC];
    s16 unk_10;
    u16 unk_12;
    u16 unk_14;
    u8 pad16[0x18 - 0x16];
    s32 unk_18;
    u8 pad1C[0x20 - 0x1C];
} SavedPlayer;

typedef struct {
    s32 x;
    s32 z;
    u8 pad08[0x10 - 0x8];
} SavedPos;

typedef struct {
    SavedPlayer players[30];
    s32 unk_3C0;
    s32 unk_3C4;
    s32 unk_3C8;
    u8 pad3CC[0x3D0 - 0x3CC];
    u16 unk_3D0;
    u16 unk_3D2;
    u16 unk_3D4;
    u8 pad3D6[0x3D8 - 0x3D6];
    s8 unk_3D8;
    u8 unk_3D9[9];
    s8 unk_3E2[8];
    s8 unk_3EA;
    s8 unk_3EB;
    s16 unk_3EC;
    u8 pad3EE[0x3F0 - 0x3EE];
    s32 unk_3F0;
    s32 unk_3F4;
    s32 unk_3F8;
    u8 pad3FC[0x400 - 0x3FC];
    SavedPos unk_400[4];
    s32 unk_440;
    s32 unk_444;
    u8 pad448[0x450 - 0x448];
    u16 unk_450[2][11];
    u8 pad47C[0x47C - 0x47C];
    s32 unk_47C;
} SaveState;

extern SaveState *D_80087128;
extern Player *D_80085040[][22];
extern Player D_80087138[];
extern Body *D_80086178;
extern Body *D_80087B54;
typedef struct {
    u16 unk_00;
    u16 unk_02;
    u16 unk_04;
} Angles;

extern Angles D_800876E0;
extern s32 D_8008A058;
extern u8 D_80085E50[];
extern s32 D_80086C60;
extern u16 D_8008B1F8[];
extern s16 D_80089308[];
extern s8 D_80088076;
extern Body *D_80087AD0[];
extern Body *D_8008794C;
extern Body *D_800886E4;
extern s32 D_8008B390;
extern Body *D_80088480;
extern s32 D_80088090;
extern Body *D_8008B620[2];
extern Body *D_80087950;
void func_8003B9C0(u16 a, u16 b, u16 c);
void func_800C16A0(Player *p, s16 a);
u16 masked_lookup_value(Body *b, u16 a, u16 c);
void func_80096A00(s32 a, u16 b);
void func_80034388(Body *b, s32 a);
void func_80033B20(Body *b, s32 a);
void func_8009BA3C(void);
void func_8000C8CC(s32 a);
void func_80032F3C(s32 a, SaveState *s);

void func_800B49CC(void) {
    s16 i;
    s16 j;
    Player *p;

    for (i = 0; i < 2; i++) {
        for (j = 0; j < 11; j++) {
            func_8003B9C0(i, j, D_80087128->unk_450[i][j]);
        }
    }
    for (j = 0; j < 11; j++) {
        p = D_80085040[0][j];
        p->unk_24->unk_1C = D_80087128->players[j].x;
        p->unk_24->unk_20 = D_80087128->players[j].y;
        p->unk_24->unk_24 = D_80087128->players[j].z;
        func_800C16A0(p, D_80087128->players[j].unk_10);
        p->unk_24->unk_18 = masked_lookup_value(p->unk_24, D_80087128->players[j].unk_12, D_80087128->players[j].unk_14);
        p->unk_24->unk_14 = D_80087128->players[j].unk_18;
    }
    for (j = 0; j < 11; j++) {
        p = D_80085040[1][j];
        p->unk_24->unk_1C = D_80087128->players[j + 11].x;
        p->unk_24->unk_20 = D_80087128->players[j + 11].y;
        p->unk_24->unk_24 = D_80087128->players[j + 11].z;
        func_800C16A0(p, D_80087128->players[j + 11].unk_10);
        p->unk_24->unk_18 = masked_lookup_value(p->unk_24, D_80087128->players[j + 11].unk_12, D_80087128->players[j + 11].unk_14);
        p->unk_24->unk_14 = D_80087128->players[j + 11].unk_18;
    }
    for (j = 0; j < 8; j++) {
        p = &D_80087138[j];
        p->unk_24->unk_1C = D_80087128->players[j + 22].x;
        p->unk_24->unk_20 = D_80087128->players[j + 22].y;
        p->unk_24->unk_24 = D_80087128->players[j + 22].z;
        func_800C16A0(p, D_80087128->players[j + 22].unk_10);
        p->unk_24->unk_18 = masked_lookup_value(p->unk_24, D_80087128->players[j + 22].unk_12, D_80087128->players[j + 22].unk_14);
        p->unk_24->unk_14 = D_80087128->players[j + 22].unk_18;
    }
    D_8008A058 = D_80087128->unk_47C;
    D_80086178->unk_1C = D_80087128->unk_3C0;
    D_80086178->unk_20 = D_80087128->unk_3C4;
    D_80086178->unk_24 = D_80087128->unk_3C8;
    D_800876E0.unk_00 = D_80087128->unk_3D0;
    D_800876E0.unk_02 = D_80087128->unk_3D2;
    D_800876E0.unk_04 = D_80087128->unk_3D4;
    D_80087B54->unk_1C = D_80086178->unk_1C;
    D_80087B54->unk_20 = D_80086178->unk_20;
    D_80087B54->unk_08->unk_12 = D_800876E0.unk_02 + 0x400;
    if (D_80087128->unk_3D8 == 1) {
        D_80086178->unk_14 |= 1;
        D_80087B54->unk_14 |= 1;
    } else {
        D_80086178->unk_14 &= ~1;
        D_80087B54->unk_14 &= ~1;
    }
    for (j = 0; j < 9; j++) {
        D_80085E50[j] = D_80087128->unk_3D9[j];
    }
    func_80096A00(D_80086C60, D_8008B1F8[D_80089308[D_80088076]]);
    j = 8;
    while (j-- != 0) {
        if (D_80087128->unk_3E2[j] != 0) {
            D_80087AD0[j]->unk_14 |= 1;
        }
    }
    if (D_80087128->unk_3EA == 1) {
        D_8008794C->unk_14 |= 1;
    } else {
        D_8008794C->unk_14 &= ~1;
    }
    if (D_80087128->unk_3EB != 0) {
        D_800886E4->unk_14 |= 1;
    } else {
        D_800886E4->unk_14 &= ~1;
    }
    func_80034388(D_8008794C, D_8008B390);
    func_80033B20(D_8008794C, 1);
    D_8008794C->unk_1C = D_80087128->unk_3F0;
    D_8008794C->unk_20 = D_80087128->unk_3F4;
    D_8008794C->unk_24 = D_80087128->unk_3F8;
    for (j = 0; j < 4; j++) {
        D_80087138[j + 4].unk_24->unk_1C = D_80087128->unk_400[j].x;
        D_80087138[j + 4].unk_24->unk_20 = D_80087128->unk_400[j].z;
    }
    func_8009BA3C();
    D_80088480->unk_1C = D_80087128->unk_440;
    D_80088480->unk_20 = D_80087128->unk_444;
    if (D_80087128->unk_3EC != 0) {
        func_8000C8CC(D_80088090);
        D_8008B620[0]->unk_20 = -D_8008B620[0]->unk_20;
        D_8008B620[1]->unk_20 = -D_8008B620[1]->unk_20;
    }
    if (D_80087950 != 0) {
        D_80087950->unk_14 |= 1;
    }
    func_80032F3C(0, D_80087128);
}
