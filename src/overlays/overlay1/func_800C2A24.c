#include "types.h"

typedef struct {
    s32 unk_00;
    s16 unk_04;
    s16 unk_06;
    s16 unk_08;
    s32 unk_0C;
    s32 unk_10;
    s32 unk_14;
    s32 unk_18;
    s32 unk_1C;
    s32 unk_20;
    s32 unk_24;
} ObjDesc;

typedef struct {
    u8 pad00[0x1C];
    s32 unk_1C;
    s32 unk_20;
} Obj;

typedef struct {
    Obj *obj;
    s32 unk_04;
} ObjSlot;

void *func_8000D740(s32, s32, ObjDesc *);
void *func_8000D8DC(s32, ObjDesc *);
void func_800167FC(s16, s8 *);
void func_80016FE4(void *);
void func_80017CDC(void *, s32);
void func_8001AA3C(void *, s32);
s32 func_8001AEA8(void **);
s16 func_800AACE8(s32, void *, s32);
typedef struct {
    s8 c[2];
} Lit2;

extern Lit2 D_800029A8;
extern u16 D_80064A4E;
extern s16 D_80072730[];
extern void *D_80072750[];
extern u8 D_80072774[];
extern s16 D_80080C0A;
extern s16 D_80080C20;
extern u8 *D_80080C80;
extern u8 *D_80084F74;
extern s16 D_8008501C;
extern ObjSlot D_80086DEC[];
extern Lit2 D_80087124;
extern s32 D_800876F8;
extern s32 D_80087A64;
extern u8 *D_80087A98;
extern u8 *D_80088DC0;
extern s32 D_80089344;
extern s16 D_8008A6A0;
extern s16 D_8008A6A2;
extern s16 D_8008A6C0;
extern Obj *D_8008AF94;
extern s16 D_8008B33C;

void func_800C2A24(void) {
    ObjDesc desc;
    s32 rate;

    desc.unk_0C = 0x1090;
    desc.unk_04 = 5;
    desc.unk_06 = 0;
    desc.unk_08 = 0;
    desc.unk_10 = 0;
    desc.unk_18 = 0;
    desc.unk_00 = 0x1B;
    desc.unk_24 = D_80089344;
    D_80072750[1] = func_8000D8DC(0, &desc);
    if (D_80080C20 == 4) {
        desc.unk_0C = 0x1010;
        desc.unk_24 = 0;
        desc.unk_00 = 0x1D;
        D_80072750[2] = func_8000D8DC(0, &desc);
        D_80087124 = D_800029A8;
    } else {
        desc.unk_0C = 0x1110;
        desc.unk_24 = 0;
        desc.unk_00 = D_80072730[D_8008B33C];
        D_80072750[2] = func_8000D8DC(0, &desc);
        func_80017CDC(D_80072750[2], 1);
        rate = 200;
        switch ((u16) (D_80064A4E % 384) >> 7) {
            case 0:
                rate = 300;
                break;
            case 1:
                break;
            case 2:
            case 3:
                rate = 100;
                break;
        }
        func_8001AA3C(D_80072750[2], rate);
        func_800167FC(D_80064A4E / 19, D_80087124.c);
    }
    desc.unk_0C = 0x10;
    desc.unk_04 = 2;
    desc.unk_00 = 0x1C;
    D_8008AF94 = func_8000D740(D_80087A64, 0, &desc);
    func_80016FE4(D_80072750[1]);
    func_80016FE4(D_80072750[2]);
    func_80016FE4(D_8008AF94);
    D_800876F8 = func_8001AEA8(D_80072750);
    D_8008A6A0 = func_800AACE8(0x108, D_80072774, 3);
    D_8008A6A2 = func_800AACE8(0x110, D_80072774, 1);
    D_8008A6C0 = func_800AACE8(0x118, D_80072774, 1);
    D_80084F74[0] = D_80080C80[0] = 0;
    D_80084F74[1] = D_80080C80[1] = 0x7F;
    D_80087A98[0] = D_80088DC0[0] = 0;
    D_80087A98[1] = D_80088DC0[1] = 0x7F;
    D_8008AF94->unk_1C = D_80080C0A - 4;
    D_8008AF94->unk_20 = D_8008501C + 3;
    D_80086DEC[D_8008A6C0].obj->unk_1C = -1;
    D_80086DEC[D_8008A6C0].obj->unk_20 = 0x7F00;
}
