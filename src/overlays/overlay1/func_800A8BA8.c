#include "types.h"

typedef struct {
    u8 pad0[0x1C];
    s32 unk_1C;
    s32 unk_20;
} Model;

typedef struct {
    u8 pad0[0xA];
    s16 unk_A;
    Model *unk_C;
    u8 pad10[0x4];
    s32 unk_14;
    s32 unk_18;
    u8 pad1C[0x30];
    s16 unk_4C;
    s16 unk_4E;
    s16 unk_50;
    u8 pad52[0x2];
    s16 unk_54;
    s16 unk_56;
    s16 unk_58;
    u8 pad5A[0x1A];
    s16 unk_74;
    s16 unk_76;
    s16 unk_78;
    u8 pad7A[0x2];
    s16 unk_7C;
    s16 unk_7E;
    s16 unk_80;
    u8 pad82[0x1E];
    s32 unk_A0;
} Actor;

typedef struct {
    s32 unk_0;
    s32 unk_4;
    s32 unk_8;
} Vec3i;

typedef struct {
    u16 unk_0;
    s16 unk_2;
    u16 unk_4;
} Vec3s;

typedef struct {
    s32 unk_0;
    s32 unk_4;
    u16 unk_8;
} Entry;

s32 func_8000C8EC(s32);
void func_800A2E58(Actor *, Vec3i *);
void func_800A2EB4(Actor *, Vec3s *);
void func_800A6A70(Actor *, s32, s32);
extern Entry D_8006A7E0[];

void func_800A8BA8(Actor *actor) {
    Vec3i pos;
    Vec3s rot;

    actor->unk_4C = 4;
    actor->unk_4E = 4;
    actor->unk_50 = 4;
    actor->unk_54 = 7;
    actor->unk_56 = 7;
    actor->unk_58 = 7;
    actor->unk_74 = 4;
    actor->unk_76 = 4;
    actor->unk_78 = 4;
    actor->unk_7C = 5;
    actor->unk_7E = 5;
    actor->unk_80 = 5;
    rot.unk_2 = 0;
    pos.unk_0 = actor->unk_C->unk_1C;
    if (func_8000C8EC(actor->unk_14) != 0) {
        rot.unk_4 = 0x7FF;
    } else {
        rot.unk_4 = 0;
    }
    actor->unk_18 = D_8006A7E0[actor->unk_A].unk_0;
    pos.unk_8 = D_8006A7E0[actor->unk_A].unk_4;
    rot.unk_0 = D_8006A7E0[actor->unk_A].unk_8;
    switch (actor->unk_A) {
    case 1:
        actor->unk_18 = 0x01000000;
        pos.unk_8 = 0x6E0000;
        rot.unk_0 = 0x48E;
        break;
    case 2:
        actor->unk_4C = 3;
        actor->unk_54 = 6;
        actor->unk_18 = 0x01000000;
        pos.unk_8 = 0x780000;
        rot.unk_0 = 0x48E;
        break;
    case 5:
        actor->unk_18 = 0x01300000;
        pos.unk_8 = 0x6E0000;
        rot.unk_0 = 0x488;
        break;
    case 0:
    case 12:
        actor->unk_18 = 0x01100000;
        pos.unk_8 = 0x6E0000;
        rot.unk_0 = 0x4F2;
        break;
    case 3:
        actor->unk_18 = 0x01300000;
        pos.unk_8 = 0x6E0000;
        rot.unk_0 = 0x48E;
        actor->unk_4C = 0;
        actor->unk_4E = 0;
        actor->unk_50 = 0;
        actor->unk_54 = 0;
        actor->unk_56 = 0;
        actor->unk_58 = 0;
        break;
    case 4:
        actor->unk_18 = 0xC00000;
        pos.unk_8 = 0x640000;
        rot.unk_0 = 0x48E;
        actor->unk_56 = 6;
        break;
    case 6:
        actor->unk_18 = 0x01100000;
        pos.unk_8 = 0x6E0000;
        rot.unk_0 = 0x4F2;
        func_800A6A70(actor, 0xEE, 0x11);
        rot.unk_4 += actor->unk_A0;
        break;
    }
    pos.unk_4 = actor->unk_C->unk_20 - actor->unk_18;
    func_800A2E58(actor, &pos);
    func_800A2EB4(actor, &rot);
}
