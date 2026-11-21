#include "types.h"

typedef struct {
    u32 color0 : 5;
    u32 color1 : 5;
    u32 color2 : 5;
    u32 color3 : 5;
    s32 y : 12;
    u32 color4 : 5;
    u32 color5 : 5;
    u32 color6 : 5;
    u32 color7 : 5;
    u32 color8 : 5;
    u32 pattern : 7;
    s32 x : 11;
    u32 z : 10;
    u32 slot : 4;
    u32 style : 4;
    u32 mode : 3;
    u32 view0 : 10;
    u32 view1 : 10;
    u32 view2 : 10;
    u32 flip : 1;
    u32 pad : 1;
} SaveEntry;

typedef struct {
    u8 team : 2;
    u8 number : 4;
    u8 unk : 2;
} SaveFlags;

typedef struct {
    u8 pad0[0x40];
    SaveEntry entries[1];
    u8 pad50[0x1A280];
    SaveFlags flags[1];
} SaveData;

typedef struct {
    u8 pad0[0x1C];
    s16 x;
    u8 pad1E[0x2];
    s16 y;
    u8 pad22[0x2];
    s16 z;
} Body;

typedef struct {
    u8 pad0[0x1E];
    u8 unk_1E;
    u8 unk_1F;
    u8 pad20[0x4];
    Body *body;
} Player;

typedef struct {
    u8 pad0[0x14];
    s32 unk_14;
    u8 pad18[0x4];
    s16 x;
    u8 pad1E[0x2];
    s16 y;
    u8 pad22[0x2];
    s16 z;
} Camera;

s32 func_8000C8EC(s32);
extern SaveData *D_800718E8;
extern u16 D_8007A244;
extern s32 D_80085108;
extern s8 D_80085E50[9];
extern Camera *D_80086178;
extern s16 D_800876E0[3];
extern s8 D_80088076;
extern s32 D_80088090;
extern Player *D_8008A058;
extern u16 D_8008A5B4;
extern s32 D_8008B8CC;

void func_800B3548(u16 slot) {
    SaveEntry *e;
    SaveFlags *flags;

    e = &D_800718E8->entries[slot];
    flags = &D_800718E8->flags[slot];
    e->slot = D_8008A5B4 + D_8007A244;
    e->pattern = D_80085108;
    e->mode = (D_8008B8CC & 0xF) >> 1;
    D_8008B8CC = 0;
    e->style = D_80088076;
    if (D_80085E50[0] != -1) {
        e->color0 = D_80085E50[0];
    } else {
        e->color0 = 0x1F;
    }
    if (D_80085E50[1] != -1) {
        e->color1 = D_80085E50[1];
    } else {
        e->color1 = 0x1F;
    }
    if (D_80085E50[2] != -1) {
        e->color2 = D_80085E50[2];
    } else {
        e->color2 = 0x1F;
    }
    if (D_80085E50[3] != -1) {
        e->color3 = D_80085E50[3];
    } else {
        e->color3 = 0x1F;
    }
    if (D_80085E50[4] != -1) {
        e->color4 = D_80085E50[4];
    } else {
        e->color4 = 0x1F;
    }
    if (D_80085E50[5] != -1) {
        e->color5 = D_80085E50[5];
    } else {
        e->color5 = 0x1F;
    }
    if (D_80085E50[6] != -1) {
        e->color6 = D_80085E50[6];
    } else {
        e->color6 = 0x1F;
    }
    if (D_80085E50[7] != -1) {
        e->color7 = D_80085E50[7];
    } else {
        e->color7 = 0x1F;
    }
    if (D_80085E50[8] != -1) {
        e->color8 = D_80085E50[8];
    } else {
        e->color8 = 0x1F;
    }
    if (D_8008A058 != 0) {
        e->x = D_8008A058->body->x;
        e->y = D_8008A058->body->y;
        e->z = D_8008A058->body->z;
        flags->team = D_8008A058->unk_1E;
        flags->number = D_8008A058->unk_1F;
    } else {
        e->x = D_80086178->x;
        e->y = D_80086178->y;
        e->z = D_80086178->z;
        flags->team = 3;
    }
    if (func_8000C8EC(D_80088090) != 0) {
        e->x = -e->x;
        e->y = -e->y;
    }
    e->view0 = D_800876E0[0] >> 2;
    e->view1 = D_800876E0[1] >> 2;
    e->view2 = D_800876E0[2] >> 2;
    if (D_80086178->unk_14 & 1) {
        e->flip = 1;
    } else {
        e->flip = 0;
    }
}
