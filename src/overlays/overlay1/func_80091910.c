#include "types.h"

void func_8000B614(void);
void func_8000B7E4(s32);
void func_8000BE80(void);
void func_8000BF08(void);
s32 func_8000C8A0(s32);
void func_8000C930(void *, s32, s32, s32);
void func_8000D4AC(void);
void func_8000D684(s32);
void func_8000D834(s32, s32);
void func_8000D874(s32, s32);
void func_8000DDE8(void);
u16 func_80011A98(void);
void func_80015CFC(void);
void func_80016EE4(void);
u16 func_80016FD4(void);
void func_8001AB74(void);
void func_80024F5C(void);
void func_8002E9E8(s32);
void func_8002ED70(void);
void func_8002FE58(void);
void func_800334B8(void);
void func_80035A7C(u16);
void func_800395AC(void);
void func_8003CA4C(void);
void func_80041660(void);
void func_80044AB8(void);
void func_80045794(void);
s16 func_8009321C(s32);
s32 func_80093294(s16, s16);
s16 func_800933A4(void);
void func_800967CC(void);
void func_800971DC(void);
void func_800A2FF0(void *);
void func_800A6F00(void);
void func_800AA220(void);
void func_800AF8E0(void);
void func_800B7BB8(void);
void func_800B95A8(void);
void func_800BE784(void);
void func_800BF93C(void);
void func_800E0BBC(void);
void graphics_pools_release(void);
void resource_pool_clear(void);
void transient_mode_clear(void);
extern u8 D_8006EA70;
extern u16 D_800782E8;
typedef struct { s32 unk0; s32 unk4; s32 unk8; } Result;
extern Result D_80085138;
extern s16 D_80085A40;
extern s32 D_80086A28;
extern u8 D_80086CE8[];
extern void *D_80086DD8;
extern s16 D_800876DC;
extern u8 D_80087964;
extern s32 D_8008798C;
extern s32 D_80087A64;
extern s32 D_80087AA4;
extern s32 D_80087AA8;
extern s32 D_80087AC8;
extern s32 D_80088090;
extern u16 D_80088472;
extern u16 D_800886FC;
extern void *D_80088D2C;
extern s32 D_800892AC;
extern s32 D_8008931C;
extern u8 D_800893A2;
extern s32 D_80089490;
extern s16 D_8008A5B0;
extern s32 D_8008B260;
extern u8 D_8008B3D0[];
extern u8 D_800908B8[];

void func_8008D1EC(void) {
    s16 a;
    s16 b;
    s32 sum;
    s32 side;

    while (func_80011A98() != 0) {
        func_8000BF08();
    }
    func_8000BE80();
    if (D_8008A5B0 == 4) {
        D_80087964 = D_800893A2;
    }
    func_8000D834(D_8008931C, D_8008798C);
    if (D_80087AC8 != 0) {
        func_8000D874(func_8000C8A0(D_80088090), D_80087AC8);
        func_8000D834(D_8008931C, D_80087AC8);
    }
    func_8000D874(D_80087A64, D_80086A28);
    func_8000D834(D_8008931C, D_80086A28);
    transient_mode_clear();
    func_80041660();
    func_800B7BB8();
    func_8003CA4C();
    if (D_80085A40 == 0) {
        resource_pool_clear();
    }
    func_800E0BBC();
    func_80024F5C();
    func_800BF93C();
    if (D_8006EA70 == 1) {
        func_800AF8E0();
    }
    func_800A6F00();
    func_800BE784();
    func_800AA220();
    func_8002E9E8(4);
    func_800395AC();
    func_800967CC();
    func_8000D684(D_80087A64);
    func_8000D684(D_80087AA8);
    func_800B95A8();
    func_8000B7E4(D_80088090);
    func_8000B7E4(D_80087AA4);
    func_800A2FF0(D_80086CE8);
    func_8000C930(D_8008B3D0, 0, 0, 0);
    func_8000BF08();
    func_8000BF08();
    func_8000BF08();
    func_8000BF08();
    func_8001AB74();
    func_80015CFC();
    func_80016EE4();
    func_800971DC();
    func_80045794();
    func_8000DDE8();
    func_80044AB8();
    func_80035A7C(D_80088472);
    func_80035A7C(D_800886FC);
    func_80035A7C(func_80016FD4());
    func_80035A7C(D_800782E8);
    func_8000D4AC();
    graphics_pools_release();
    func_8002FE58();
    func_8000B614();
    func_800334B8();
    if (D_80089490 != -1 && D_800876DC != 7) {
        D_80085138.unk0 = 0;
        a = func_8009321C(0);
        b = func_8009321C(1);
        sum = a + b;
        if (sum == 1) {
            if (a == sum) {
                D_80085138.unk0 = func_80093294(0, 1);
            }
            if (b == sum) {
                D_80085138.unk0 = func_80093294(1, 0);
            }
        }
        if (a + b == 2) {
            side = func_800933A4();
            D_80085138.unk0 = func_80093294(side, 1 - func_800933A4());
        }
        if (D_80085138.unk0 != 0) {
            if (D_80085138.unk0 == 6) {
                D_80085138.unk4 = 3;
                D_80085138.unk8 = 1;
                D_8008B260 = 3;
            } else {
                D_8008B260 = 1;
            }
            if (D_80085138.unk0 != 0) {
                D_800892AC = 1;
                D_80086DD8 = func_8002ED70;
                D_80088D2C = D_800908B8;
                return;
            }
        }
    }
    D_80086DD8 = D_800908B8;
}
