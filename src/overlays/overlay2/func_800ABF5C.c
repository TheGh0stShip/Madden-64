#include "types.h"

typedef struct {
    u8 pad0[0x1C];
    s32 unk1C;
    s32 unk20;
} Sprite;

typedef struct {
    u8 pad0[0x24];
    s32 unk24;
    s32 unk28;
    s32 unk2C;
    s32 unk30;
} Screen;

typedef struct {
    u8 pad0[0x38];
    s32 unk38;
    s32 unk3C;
} Sub;

typedef struct {
    s32 unk0;
    u8 pad4[0x4];
    Sprite *unk8;
    u8 padC[0xC];
    s32 unk18;
    s32 unk1C;
    s32 unk20;
    u8 pad24[0x8];
    s32 unk2C;
    s32 unk30;
    s32 unk34;
    u8 pad38[0x24];
    s32 unk5C;
    s32 unk60;
    union {
        s32 w;
        struct {
            u16 hi;
            u16 lo;
        } h;
    } unk64;
    s32 unk68;
    s32 unk6C;
    s32 unk70;
    Sub unk74;
} Owner;

extern s16 D_80084F6C;
extern s32 D_800892E8[];
extern s32 D_800892EC[];
extern s32 D_800892F0[];
extern s32 D_800892F4[];
extern u8 D_80089C18;
extern u8 D_800BF71D;
extern u8 D_800BF734;
extern u8 D_800BF75C;
extern u8 D_800BF75D;
extern u8 D_800BF76D;
extern u16 D_800C4AD0;
extern u16 D_800C4EE8;
extern u16 D_800C5098;
extern u8 D_800C5C38;

Screen *func_800DD634(void);
s16 func_800ACAE4(void);
s16 func_800E1588(s16);
void func_800DD694(s32, s32, s32);
void func_80096898(void);
void func_800D5C1C(s32, Owner *, void *);
void func_800D6424(Sprite *, s32, s32, s32);
s32 func_80032E00(s32, s32);
void func_800ACC64(Owner *);
void func_800D6060(s32, void *, Owner *);
void func_800ACA00(Owner *, s32);
void func_800E08A4(s32);

void func_800ABF5C(Owner *owner) {
    Screen *screen;
    Sprite *sprite;
    Sub *sub;
    u32 count;

    owner->unk5C = 0;
    screen = func_800DD634();
    owner->unk60 = func_800ACAE4();
    owner->unk6C = func_800E1588(D_80084F6C);
    owner->unk70 = 0xF;
    func_800DD694(0x48, 0x10, 5);
    screen->unk24 = D_800892E8[0];
    screen->unk28 = D_800892EC[0];
    screen->unk2C = D_800892F0[0];
    screen->unk30 = D_800892F4[0];
    func_80096898();
    sub = &owner->unk74;
    owner->unk18 = 0x2B8;
    owner->unk1C = 0;
    owner->unk20 = 0;
    count = owner->unk6C;
    if (count == 0) {
        if (D_800C4EE8 == 0x5AA5 || D_800C5098 == 0xA55A || D_800C4AD0 == 0xA5A5) {
            D_800BF71D = 0;
        } else if (D_80089C18 != 0) {
            D_800BF71D = 3;
        } else {
            D_800BF71D = 1;
        }
    } else {
        D_800BF71D = 4;
    }
    func_800D5C1C(0x2A0, owner, &D_800BF734);
    sprite = owner->unk8;
    sprite->unk1C = 0x14A;
    sprite->unk20 = 0;
    func_800D6424(sprite, 0, 1, 0xA);
    owner->unk68 = 0;
    sub->unk38 = func_80032E00(0, 0xA);
    sub->unk3C = func_80032E00(0, 0xA);
    func_800ACC64(owner);
    D_800BF76D = 0;
    D_800BF75C = 6;
    count = owner->unk64.h.lo;
    D_800BF75D = count;
    if (count < 6 && owner->unk64.w == 0) {
        D_800BF75D = 1;
    }
    owner->unk30 = 0x14A;
    owner->unk2C = 0;
    owner->unk34 = 0x2B0;
    func_800D6060(0x2A8, &D_800BF75C, owner);
    func_800ACA00(owner, 0);
    func_800E08A4(owner->unk0);
    D_800C5C38 = 0;
}
