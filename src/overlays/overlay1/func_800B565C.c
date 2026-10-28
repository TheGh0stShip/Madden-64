#include "types.h"

#ifndef NULL
#define NULL 0
#endif

typedef struct {
    u8 pad00[0x14];
    s32 flags;
} Obj;

typedef struct {
    u8 pad00[0x1A];
    u8 team;
} Script;

extern s32 D_80080C10;
extern Obj *D_8008A3E8[];
extern Script D_800E6C3C;
extern s32 D_800E6C5C;
extern s32 D_800E6C7C;
extern s32 D_800E6CCC;
extern s32 *D_800E6D20;
extern u8 D_800E6D9C[];
extern u8 D_80072096;
extern u8 D_800720F2;
extern u8 D_80072192;
extern u8 D_800721B2;
extern s8 D_8007A1C4;
extern s8 D_80084FA8;
extern s16 D_800857C0;
extern s16 D_800857CA;
extern s16 D_800876DC;
extern s8 D_80087AA0;
extern s8 D_80087AF2;
extern s16 D_80087B5C;
extern s32 D_80088090;
extern u8 D_80088098;
extern s8 D_800895E4;
extern s16 D_8008AF78;
extern u8 D_8008B210;
extern u8 D_8008B282;
extern u8 D_800E5FB2;
extern u8 D_800E6DD6;
extern u8 D_800E6ED2;
extern u8 D_800E6F9A;
extern u8 D_800E71A2;
extern u8 D_800E7252;
extern u8 D_800E73FA;
extern u8 D_800E7572;
extern u8 D_800E76A6;

void func_8000BF08(void);
void func_8000CDC0(void);
s32 func_8001AEA8(s32);
void func_800311D0(void);
void func_800313AC(void);
void func_8003190C(s32);
void func_800334B8(void);
void func_80036540(s32);
void func_8003C7E4(s32, s32);
void func_8003D78C(s32);
void func_80041658(void);
void func_800417C0(void);
void func_80041804(void);
void func_8009EB14(s8);
void func_800A22FC(void);
void func_800A245C(void);
void func_800A27CC(void);
void func_800A2800(void);
void func_800AA1E4(void);
void func_800AA33C(void);
void func_800AA370(void);
void func_800AAC40(void);
void func_800AAC94(void);
void func_800AD49C(void);
void func_800B13A4(void);
void func_800B1744(void);
void func_800B2394(void);
void func_800B7D98(void);
void func_800BC5C8(void);
void func_800BC98C(void);
void func_800BDF68(void);
void func_800BE1B0(void);
void func_800BE784(void);
void func_800BF1C8(void);
void func_800D05D4(void);
void func_800DC978(s32, void *, s32);
void func_800DCBC4(void);
void func_800E0CFC(void);
u16 func_800E0E24(void);

void func_800B565C(u8 team) {
    s32 i;
    s32 saved;
    s32 *seq;

    func_800B7D98();
    func_80041658();
    func_8003D78C(0);
    func_800313AC();
    func_80036540(0);
    D_8007A1C4 = 0;
    D_8008B210 = team;
    if (D_800857C0 != 0) {
        D_800857CA = 0;
        func_800AA370();
    }
    func_800AD49C();
    func_800AAC40();
    func_80041804();
    if (D_80080C10 & 0x2000) {
        func_800BE784();
        D_80080C10 |= 0x2000;
    }
    if (D_80080C10 & 0x10) {
        func_800BC98C();
        D_80080C10 |= 0x10;
    }
    func_800BF1C8();
    D_80087AF2 = 1;
    if (func_800E0E24() == 1) {
        func_800E0CFC();
    }
    func_80036540(0);
    func_800A22FC();
    func_800AA33C();
    func_8000CDC0();
    func_800334B8();
    func_8003C7E4(1, 5);
    for (i = 0; i < D_8008AF78; i++) {
        if (D_8008A3E8[i] != NULL) {
            D_8008A3E8[i]->flags &= ~1;
        }
    }
    saved = func_8001AEA8(0);
    seq = &D_800E6C5C;
next:
    {
        D_800E6D20 = seq;
        func_800B13A4();
        D_800895E4 = 0;
        D_80087AA0 = 0;
        D_8008B282 = 0;
        D_800E6C3C.team = D_8008B210;
        D_80072096 = D_8008B210;
        D_800720F2 = D_8008B210;
        D_800E6DD6 = D_8008B210;
        D_800E6ED2 = D_8008B210;
        D_800E6F9A = D_8008B210;
        D_800E71A2 = D_8008B210;
        D_800721B2 = D_8008B210;
        D_800E7572 = D_8008B210;
        D_80072192 = D_8008B210;
        D_800E7252 = D_8008B210;
        D_800E73FA = D_8008B210;
        D_800E5FB2 = D_8008B210;
        D_800E76A6 = D_8008B210;
        if (D_80088098 == 1) {
            func_800DC978(D_80088090, &D_800E6C3C, 0x3C);
        } else {
            func_800DC978(D_80088090, D_800E6D9C, 0x3C);
        }
        func_800DCBC4();
        func_800B1744();
        func_800BDF68();
        if (D_80087AA0 == 1) {
            D_80087B5C = (s8)D_8008B210;
            func_800A2800();
            func_800B2394();
            func_800A27CC();
            if (D_800876DC != 7) {
                seq = &D_800E6C7C;
                goto next;
            }
        } else if (D_800895E4 == 1) {
            func_800D05D4();
            func_800A27CC();
            if (D_800876DC != 7) {
                seq = &D_800E6CCC;
                goto next;
            }
        }
    }
    func_8003190C(0x1000);
    func_8001AEA8(saved);
    func_8003C7E4(1, 4);
    func_800AA1E4();
    func_800A245C();
    func_800AAC94();
    D_80087AF2 = 0;
    if (D_80080C10 & 0x10) {
        D_80080C10 &= ~0x10;
        func_800BC5C8();
    }
    if (D_80080C10 & 0x2000) {
        D_80080C10 &= ~0x2000;
        func_800BE1B0();
    }
    for (i = 0; i < D_8008AF78; i++) {
        if (D_8008A3E8[i] != NULL) {
            D_8008A3E8[i]->flags |= 1;
        }
    }
    func_800417C0();
    if (D_8008B282 == 1) {
        func_8009EB14(D_80084FA8);
    }
    func_800311D0();
    func_8000BF08();
    func_8000BF08();
    func_8000BF08();
}
