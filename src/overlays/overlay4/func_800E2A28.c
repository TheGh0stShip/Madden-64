#include "types.h"

typedef struct {
    u8 pad0[0x1C];
    s32 unk_1C;
    s32 unk_20;
} Model;

typedef struct {
    u8 pad0[0x206];
    u16 unk_206;
} Owner;

typedef struct {
    u8 pad0[0xC];
    Model *unk_0C;
    u8 pad10[4];
    Owner *unk_14;
    u8 pad18[0x2C - 0x18];
    s32 unk_2C;
    s32 unk_30;
    s32 unk_34;
    u8 pad38[0x50 - 0x38];
    s16 unk_50;
    u8 pad52[6];
    s16 unk_58;
    u8 pad5A[2];
    s16 unk_5C;
    s16 unk_5E;
    s16 unk_60;
    u8 pad62[6];
    s16 unk_68;
    u8 pad6A[0x74 - 0x6A];
    s16 unk_74;
    u8 pad76[2];
    s16 unk_78;
    u8 pad7A[2];
    s16 unk_7C;
    u8 pad7E[2];
    s16 unk_80;
    u8 pad82[0x98 - 0x82];
    s32 unk_98;
    s32 unk_9C;
    u8 padA0[4];
    s32 unk_A4;
} Actor;

typedef struct {
    u16 unk_00;
    u8 pad[0x214A];
} Team;

extern s16 D_80088AE4;
extern Team D_80082D94[];
extern s32 D_80071814;
extern u16 func_80031A1C(s32);

void func_800E2A28(Actor *actor) {
    actor->unk_50 = 1;
    actor->unk_58 = 1;
    actor->unk_74 = 1;
    actor->unk_7C = 1;
    actor->unk_78 = 1;
    actor->unk_80 = 1;
    if (actor->unk_14->unk_206 & 0x100) {
        actor->unk_60 = 0x800;
        actor->unk_68 = 0x800;
    } else {
        actor->unk_60 = 0;
        actor->unk_68 = 0;
    }
    actor->unk_5C = 0x500;
    actor->unk_5E = 0;
    actor->unk_A4 = 0;
    actor->unk_98 = 0x800000;
    actor->unk_9C = 0;
    actor->unk_2C = actor->unk_0C->unk_1C;
    actor->unk_30 = actor->unk_0C->unk_20;
    actor->unk_34 = 0x180000;
    D_80071814 = 0;
    if (D_80082D94[D_80088AE4].unk_00 < D_80082D94[D_80088AE4 ^ 1].unk_00) {
        if (func_80031A1C(100) < 30) {
            D_80071814 = func_80031A1C(2) + 0xCA;
            return;
        }
    } else if (D_80082D94[D_80088AE4].unk_00 - D_80082D94[D_80088AE4 ^ 1].unk_00 >= 20) {
        if (func_80031A1C(100) < 75) {
            D_80071814 = func_80031A1C(2) + 0xCC;
            return;
        }
    }
    D_80071814 = func_80031A1C(6) + 0xC4;
}
