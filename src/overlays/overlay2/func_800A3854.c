#include "types.h"

typedef struct {
    u8 pad00[0x28];
    s32 unk28;
    s32 unk2C;
    u8 pad30[8];
    s32 unk38;
    s32 unk3C;
} Game;

typedef struct {
    u8 pad00[0x44];
    s32 unk44;
    s32 unk48;
    s32 unk4C;
    s32 unk50;
} Obj;

typedef struct {
    u8 data[0x10];
} Slot;

extern Slot D_800BF140[3];
extern s16 D_80087A68;
extern s16 D_800BDF08;
extern s16 D_80087A60;
extern Game *D_80087938;
extern u16 D_80084F40;
extern u16 D_800892B6;
extern u8 D_80082DDC[];
extern u8 D_80082E3E;
extern s16 D_800C5C3A;
extern s16 D_80087A92;
extern s32 D_80087AA8;
extern s32 D_80086C00[];
extern u16 D_800C4EE0;

void func_80036540(s32);
void func_80024E9C(void);
s32 func_800E0138(void *);
void func_800A3A74(s32);
Obj *func_800DD634(void);
void func_8000BE80(void);
void func_8000DA98(s32);
void func_80035F88(u16, s32);
void func_80032F3C(s32, Game *);
void func_8003A7DC(u16, u8 *);
void func_800D5D28(void *);
void func_8000D998(s32, s32);
void func_800DD788(s32);
void func_80092B98(void);
void func_80016FC4(u16);

void func_800A3854(void *screen) {
    Obj *obj;
    Slot *slot;
    s32 len;
    s16 i;

    func_80036540(0);
    func_80024E9C();
    slot = &D_800BF140[1];
    D_80087A68 = func_800E0138(slot);
    D_800BDF08 = func_800E0138(slot + 1);
    len = func_800E0138(slot - 1);
    if (len != 1) {
        if (len == 0) {
            goto len0;
        }
        if (len == 2) {
            goto len2;
        }
        if (len == 3) {
            goto len3;
        }
        goto skip;
    } else {
        D_80087A60 = 0x12C;
    }
    goto skip;
len0:
    D_80087A60 = 0xB4;
    goto skip;
len2:
    D_80087A60 = 0x258;
    goto skip;
len3:
    D_80087A60 = 0x384;
skip:
    func_800A3A74(0);
    func_800A3A74(1);
    obj = func_800DD634();
    func_8000BE80();
    if (D_80087938->unk38 != 0) {
        func_8000DA98(D_80087938->unk38);
    }
    if (D_80087938->unk3C != 0) {
        func_8000DA98(D_80087938->unk3C);
    }
    func_80035F88(D_80084F40, D_80087938->unk28);
    func_80035F88(D_80084F40, D_80087938->unk2C);
    obj->unk48 = 0;
    obj->unk50 = 0;
    obj->unk44 = 0;
    obj->unk4C = 0;
    func_80032F3C(0, D_80087938);
    func_8003A7DC(D_800892B6, D_80082DDC);
    if (D_800C5C3A == 0) {
        D_80087A92 = D_80082E3E;
    }
    func_800D5D28(screen);
    for (i = 0; i < 8; i++) {
        func_8000D998(D_80087AA8, D_80086C00[i]);
    }
    func_800DD788(0x14);
    func_800DD788(0x15);
    func_80092B98();
    func_80092B98();
    func_80092B98();
    func_80016FC4(D_800C4EE0);
}
