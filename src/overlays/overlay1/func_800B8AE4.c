#include "types.h"

typedef struct {
    u8 pad00[0x14];
    u16 unk14;
} Model;

typedef struct {
    u8 pad00[0x8];
    Model *model;
    u8 pad0C[0x8];
    s32 unk14;
    s32 unk18;
    s32 x;
    s32 y;
    s32 z;
} Body;

typedef struct {
    u8 pad00[0x14];
    s32 flags;
    u8 pad18[0x4];
    s32 x;
    s32 y;
    s32 z;
} Sprite;

typedef struct {
    u8 pad00[0x24];
    Body *body;
    u8 pad28[0xB0 - 0x28];
} Player;

typedef struct {
    s32 x;
    s32 y;
    s32 z;
    u8 pad0C[4];
    s16 angle;
    s16 unk12;
    s16 unk14;
    u8 pad16[2];
    s32 unk18;
    u8 pad1C[4];
} SavedPlayer;

typedef struct {
    s32 a;
    s32 b;
    u8 pad08[8];
} Pair;

typedef struct {
    u16 values[11];
    u8 pad16[0x214C - 0x16];
} Roster;

typedef struct {
    SavedPlayer players[30];
    s32 camX;
    s32 camY;
    s32 camZ;
    u8 pad3CC[4];
    u16 unk3D0;
    u16 unk3D2;
    u16 unk3D4;
    u8 pad3D6[2];
    u8 camFlag;
    u8 unk3D9[9];
    u8 unk3E2[8];
    u8 ballFlag;
    u8 unk3EB;
    s16 unk3EC;
    u8 pad3EE[2];
    s32 ballX;
    s32 ballY;
    s32 ballZ;
    u8 pad3FC[4];
    Pair pairs[4];
    s32 unk440;
    s32 unk444;
    u8 pad448[8];
    u16 rosters[2][11];
    s32 unk47C;
} Save;

s32 func_8000C8DC(s32);
s16 func_8000C8EC(s32);
Save *func_80032E00(s32, s32);
s16 func_800C157C(Player *);

extern Roster D_80081860[];
extern Player *D_80085040[];
extern Player *D_80085098[];
extern u8 D_80085E50[];
extern Sprite *D_80086178;
extern Save *D_80087128;
extern Player D_80087138[];
extern Pair D_80080C40[];
extern u16 D_800876E0[3];
extern Sprite *D_8008794C;
extern Sprite *D_80087950;
extern Sprite *D_80087AD0[];
extern Sprite *D_80088480;
extern s32 D_80088090;
extern Sprite *D_800886E4;
extern s32 D_8008A058;
extern Sprite *D_8008B620[];

void func_800B43C0(void) {
    Player *player;
    s16 i;
    s16 j;

    D_80087128 = func_80032E00(0, 0x480);
    D_80087128->unk47C = D_8008A058;
    for (j = 0; j < 2; j++) {
        for (i = 0; i < 11; i++) {
            D_80087128->rosters[j][i] = D_80081860[j].values[i];
        }
    }
    for (i = 0; i < 11; i++) {
        player = D_80085040[i];
        D_80087128->players[i].x = player->body->x;
        D_80087128->players[i].y = player->body->y;
        D_80087128->players[i].z = player->body->z;
        D_80087128->players[i].angle = func_800C157C(player);
        D_80087128->players[i].unk12 = player->body->unk18;
        D_80087128->players[i].unk14 = player->body->model->unk14 >> 8;
        D_80087128->players[i].unk18 = player->body->unk14;
    }
    for (i = 0; i < 11; i++) {
        player = D_80085098[i];
        D_80087128->players[i + 11].x = player->body->x;
        D_80087128->players[i + 11].y = player->body->y;
        D_80087128->players[i + 11].z = player->body->z;
        D_80087128->players[i + 11].angle = func_800C157C(player);
        D_80087128->players[i + 11].unk12 = player->body->unk18;
        D_80087128->players[i + 11].unk14 = player->body->model->unk14 >> 8;
        D_80087128->players[i + 11].unk18 = player->body->unk14;
    }
    for (i = 0; i < 8; i++) {
        player = &D_80087138[i];
        D_80087128->players[i + 22].x = player->body->x;
        D_80087128->players[i + 22].y = player->body->y;
        D_80087128->players[i + 22].z = player->body->z;
        D_80087128->players[i + 22].angle = func_800C157C(player);
        D_80087128->players[i + 22].unk12 = player->body->unk18;
        D_80087128->players[i + 22].unk14 = player->body->model->unk14 >> 8;
        D_80087128->players[i + 22].unk18 = player->body->unk14;
    }
    D_80087128->camX = D_80086178->x;
    D_80087128->camY = D_80086178->y;
    D_80087128->camZ = D_80086178->z;
    D_80087128->unk3D0 = D_800876E0[0];
    D_80087128->unk3D2 = D_800876E0[1];
    D_80087128->unk3D4 = D_800876E0[2];
    if (D_80086178->flags & 1) {
        D_80087128->camFlag = 1;
    } else {
        D_80087128->camFlag = 0;
    }
    if (D_800886E4->flags & 1) {
        D_80087128->unk3EB = 1;
    } else {
        D_80087128->unk3EB = 0;
    }
    D_800886E4->flags &= ~1;
    for (i = 0; i < 9; i++) {
        D_80087128->unk3D9[i] = D_80085E50[i];
    }
    i = 7;
    do {
        D_80087128->unk3E2[i] = 0;
        if (D_80087AD0[i]->flags & 1) {
            D_80087128->unk3E2[i] = 1;
        }
        D_80087AD0[i]->flags &= ~1;
    } while (i--);
    if (D_8008794C->flags & 1) {
        D_80087128->ballFlag = 1;
    } else {
        D_80087128->ballFlag = 0;
    }
    D_80087128->ballX = D_8008794C->x;
    D_80087128->ballY = D_8008794C->y;
    D_80087128->ballZ = D_8008794C->z;
    for (i = 0; i < 4; i++) {
        D_80087128->pairs[i].a = D_80080C40[i].a;
        D_80087128->pairs[i].b = D_80080C40[i].b;
    }
    D_80087128->unk440 = D_80088480->x;
    D_80087128->unk444 = D_80088480->y;
    if (D_80087128->unk3EC = func_8000C8EC(D_80088090)) {
        D_8008B620[0]->y = -D_8008B620[0]->y;
        D_8008B620[1]->y = -D_8008B620[1]->y;
        func_8000C8DC(D_80088090);
    }
    if (D_80087950 != 0) {
        D_80087950->flags &= ~1;
    }
}
