#include "types.h"

typedef struct {
    u8 unk_00[0x28];
    s32 unk_28;
} Sprite;

typedef struct {
    u8 unk_00[8];
    Sprite *unk_08;
    void *unk_0C;
    u8 unk_10[4];
    s32 unk_14;
    s32 unk_18;
    u8 unk_1C[0x20];
    s16 unk_3C;
} Obj;

extern u16 D_800886FC;
extern s32 D_80085298;
extern s32 D_80069AB8[];
extern s32 D_80069B48[];
extern Obj *D_80088490[];
extern u16 D_800726EC[];
extern Obj *D_8008794C;
extern s32 D_8008B390;
extern Obj *D_80086C40[];
extern u16 D_8008B1F8[];
extern s32 D_8008775C;
extern Obj *D_80087AD0[];
extern u8 D_80072710[];
extern u8 D_80072718[];
extern u8 D_80088076;
extern s16 D_8008807C;
extern u8 D_8008A3FE;
extern s32 D_800726F8[];
extern u8 D_800BCB74[];

s32 func_80035D7C(u16, s32);
void func_80035F88(u16, s32);
s32 func_80096878(s32, s32);
Obj *func_8000D740(s32, s32, s32 *);
void func_80034388(Obj *, s32);
void func_80096A00(Obj *, u16);
void func_800BC98C(void);
void func_800950E0(Obj *, s32);
void func_80095150(Obj *, s32);
void func_80033B20(Obj *, s32);
void func_8009562C(Obj *);
void func_80097578(Obj *, Obj *);
void func_80097590(Obj *, u8, u8);
void func_800BCB04(void);
void func_800BCEA0(void);
void func_800BCE14(void);

void func_800BC038(s32 arg0) {
    u16 i;
    s32 base;
    s32 tex;
    u16 slot;

    base = func_80035D7C(D_800886FC, 0x39);
    tex = func_80096878(0x10, base);
    for (i = 0; i < 5; i++) {
        D_80088490[i] = func_8000D740(D_80085298, 6, D_80069AB8);
        func_80034388(D_80088490[i], D_800726EC[i]);
        func_80096A00(D_80088490[i], tex);
        D_80088490[i]->unk_0C = func_800BCB04;
        D_80088490[i]->unk_14 &= ~1;
    }
    func_800BC98C();
    i = 0;
    D_80069B48[0] = D_80069AB8[0];
    D_8008794C = func_8000D740(arg0, 0xB, D_80069B48);
    func_800950E0(D_8008794C, 1);
    D_8008794C->unk_08->unk_28 = 0x600;
    func_80034388(D_8008794C, 0x107);
    D_8008B390 = 0x107;
    func_80096A00(D_8008794C, tex);
    D_8008794C->unk_0C = func_800BCEA0;
    D_8008794C->unk_14 &= ~1;
    for (; i < 9; i++) {
        if (i == 8) {
            D_80069AB8[10] = 0;
        }
        D_80086C40[i] = func_8000D740(arg0, 0xB, D_80069AB8);
        func_800950E0(D_80086C40[i], 1);
        func_80095150(D_80086C40[i], 0x96);
        D_80086C40[i]->unk_08->unk_28 = 0x1E0;
        func_80034388(D_80086C40[i], 0x105);
        if (i == 8) {
            func_80034388(D_80086C40[8], 0x106);
        }
        if (i == 0) {
            D_80069AB8[10] = (s32)D_80086C40[0];
            func_80033B20(D_80086C40[0], 1);
            func_8009562C(D_80086C40[0]);
        }
        base += 0x20;
        slot = func_80096878(0x10, base);
        D_8008B1F8[i] = slot;
        if (i < 4) {
            func_80096A00(D_80086C40[i], slot);
        } else {
            func_80096A00(D_80086C40[i], D_8008B1F8[0]);
        }
        D_80086C40[i]->unk_0C = D_800BCB74;
        D_80086C40[i]->unk_14 &= ~1;
        D_80086C40[i]->unk_3C = i;
        if (i < 8) {
            D_80087AD0[i] = func_8000D740(D_8008775C, 4, 0);
            D_80087AD0[i]->unk_18 = 0;
            D_80087AD0[i]->unk_14 &= ~1;
            func_80097578(D_80087AD0[i], D_80086C40[i]);
            func_80097590(D_80087AD0[i], D_80072710[i], D_80072718[i]);
            D_80087AD0[i]->unk_3C = i;
            D_80087AD0[i]->unk_0C = func_800BCE14;
        }
    }
    D_80088076 = 8;
    D_80069AB8[10] = 0;
    D_8008807C = 0;
    func_80035F88(D_800886FC, 0x39);
    D_8008A3FE = 0;
    for (i = 0; i < 6; i++) {
        D_800726F8[i] = 0;
    }
}
