#include "types.h"

typedef struct {
    s32 unk00;
    u16 unk04;
    s16 unk06;
    s16 unk08;
    s16 unk0A;
    s32 unk0C;
    s32 unk10;
    u16 names[2][11];
} MatchInfo;

typedef struct {
    u16 name[11];
    u8 pad[0x214C - 22];
} TeamName;

extern s16 D_80064A72;
extern s16 D_800718E0;
extern s16 D_800718E4;
extern MatchInfo *D_800718E8;
extern s16 D_8007A244;
extern TeamName D_80081860[];
extern s32 D_80084F34;
extern s32 D_8008793C;
extern s32 D_80088090;
extern s32 D_80088620;
extern u16 D_80088AE4;
extern s32 D_8008AFC0;
extern s32 D_8008B8CC;

s32 func_8000C8EC(s32);

void func_800B66A8(void) {
    u32 team;
    u32 i;
    s32 dir;

    D_800718E4 = 1;
    D_800718E0 = 0;
    D_80064A72 = 0;
    D_8008B8CC = 0;
    D_800718E8->unk04 = D_80088AE4;
    dir = func_8000C8EC(D_80088090);
    D_8008AFC0 = 0;
    D_800718E8->unk06 = dir;
    D_800718E8->unk08 = 0;
    D_800718E8->unk0A = 0;
    if (func_8000C8EC(D_80088090) == 0) {
        D_800718E8->unk0C = D_80084F34;
        D_800718E8->unk10 = D_8008793C;
    } else {
        D_800718E8->unk0C = -D_80084F34;
        D_800718E8->unk10 = -D_8008793C;
    }
    for (team = 0; team < 2; team++) {
        for (i = 0; i < 11; i++) {
            D_800718E8->names[team][i] = D_80081860[team].name[i];
        }
    }
    D_8007A244 = 0;
    D_800718E8->unk00 = D_80088620;
}
