#include "types.h"

typedef struct {
    u8 unk_00[0x1C];
    s32 unk_1C;
    s32 unk_20;
    u8 unk_24[0x8];
    s32 unk_2C;
    s32 unk_30;
} Body;

typedef struct Player {
    struct Player *next;
    u8 unk_04[0x20];
    Body *unk_24;
} Player;

typedef struct {
    Body *body;
    u8 unk_04[0xAC];
} Slot;

typedef struct {
    s32 a;
    s32 b;
    u8 unk_08[0x8];
} Pair;

typedef struct {
    u8 unk_00[0x2];
    s16 unk_02;
    u8 unk_04[0x10];
    s32 unk_14;
} Task;

typedef struct {
    u8 unk0;
} Event;

void func_800C5F80(void);
s32 func_800C157C(Player *);
void func_800C16A0(Player *, s16);
void func_8009BA3C(void);
void func_800B9794(void);
void func_800E1914(Player *);
void func_800A2E4C(void *, Body *);
s32 func_8000C8EC(s32);
void func_8000C8DC(s32);
void func_8000C8CC(s32);
extern Event D_80087AB0;
extern Player *D_800855F8;
extern Body *D_80086178;
extern s32 D_80087A70[2];
extern Body *D_8008794C;
extern s32 D_80084F30[2];
extern s32 D_8008793C;
extern s32 D_8008A720;
extern Slot D_8008715C[8];
extern Pair D_80080C40[4];
extern Body *D_800886E4;
extern Body *D_80088480;
extern Body *D_8008B620[2];
extern u8 D_80086CE8[];
extern Task *D_8008A724[1];
extern void (*D_8006A780[])(Task *);

void func_800A3294(void) {
    Player *p;
    s16 i;

    D_80087AB0.unk0 = 0x20;
    func_800C5F80();
    p = D_800855F8;
    while (p != 0) {
        p->unk_24->unk_1C = -p->unk_24->unk_1C;
        p->unk_24->unk_20 = -p->unk_24->unk_20;
        p->unk_24->unk_2C = -p->unk_24->unk_2C;
        p->unk_24->unk_30 = -p->unk_24->unk_30;
        func_800C16A0(p, func_800C157C(p) + 0x800);
        p = p->next;
    }
    D_80086178->unk_1C = -D_80086178->unk_1C;
    D_80086178->unk_20 = -D_80086178->unk_20;
    D_80086178->unk_2C = -D_80086178->unk_2C;
    D_80086178->unk_30 = -D_80086178->unk_30;
    if (D_80087A70[0] != 0x7FFFFFFF) {
        D_80087A70[0] = -D_80087A70[0];
        D_80087A70[1] = -D_80087A70[1];
        D_8008794C->unk_1C = D_80087A70[0];
        D_8008794C->unk_20 = D_80087A70[1];
    }
    D_80084F30[0] = -D_80084F30[0];
    D_80084F30[1] = -D_80084F30[1];
    D_8008793C = -D_8008793C;
    D_8008A720 = -D_8008A720;
    for (i = 0; i < 8; i++) {
        D_8008715C[i].body->unk_1C = -D_8008715C[i].body->unk_1C;
        D_8008715C[i].body->unk_20 = -D_8008715C[i].body->unk_20;
        D_8008715C[i].body->unk_2C = -D_8008715C[i].body->unk_2C;
        D_8008715C[i].body->unk_30 = -D_8008715C[i].body->unk_30;
    }
    func_8009BA3C();
    for (i = 0; i < 4; i++) {
        D_80080C40[i].a = -D_80080C40[i].a;
        D_80080C40[i].b = -D_80080C40[i].b;
    }
    D_800886E4->unk_1C = -D_800886E4->unk_1C;
    D_800886E4->unk_20 = -D_800886E4->unk_20;
    D_80088480->unk_1C = -D_80088480->unk_1C;
    D_80088480->unk_20 = -D_80088480->unk_20;
    D_8008B620[0]->unk_20 = -D_8008B620[0]->unk_20;
    D_8008B620[1]->unk_20 = -D_8008B620[1]->unk_20;
    func_800B9794();
    func_800E1914(D_800855F8);
    func_800A2E4C(D_80086CE8, D_80086178);
    for (i = 0; i < 1; i++) {
        if (D_8008A724[i] == 0) {
            continue;
        }
        if (func_8000C8EC(D_8008A724[i]->unk_14)) {
            func_8000C8DC(D_8008A724[i]->unk_14);
        } else {
            func_8000C8CC(D_8008A724[i]->unk_14);
        }
        D_8006A780[D_8008A724[i]->unk_02](D_8008A724[i]);
    }
}
