#include "types.h"

typedef struct {
    s32 unk_00;
    s32 unk_04;
    u16 unk_08;
} CamPreset;

typedef struct {
    u8 pad_00[0x1C];
    s32 unk_1C;
    s32 unk_20;
} Target;

typedef struct {
    u8 pad_00[0x6];
    u16 unk_06;
    u8 pad_08[0x2];
    s16 unk_0A;
    Target *unk_0C;
    u8 pad_10[0x4];
    s32 unk_14;
    s32 unk_18;
    u8 pad_1C[0x30];
    s16 unk_4C;
    s16 unk_4E;
    s16 unk_50;
    u8 pad_52[0x2];
    s16 unk_54;
    s16 unk_56;
    s16 unk_58;
    u8 pad_5A[0x1A];
    s16 unk_74;
    s16 unk_76;
    s16 unk_78;
    u8 pad_7A[0x2];
    s16 unk_7C;
    s16 unk_7E;
    s16 unk_80;
    u8 pad_82[0x16];
    s32 unk_98;
} Camera;

typedef struct {
    u8 pad_00[0x206];
    u16 unk_206;
} Options;

extern CamPreset D_8006A7E0[];
extern Options *D_80088090;
s32 func_8000C8EC(s32);
void func_800A2E58(Camera *, s32 *);
void func_800A2EB4(Camera *, u16 *);
void func_800A6C48(Camera *);
void func_800B9274(s16, s32 *, s32);

void func_800A91F4(Camera *arg0) {
    s32 pos[3];
    u16 rot[3];

    arg0->unk_4C = 4;
    arg0->unk_4E = 4;
    arg0->unk_50 = 4;
    arg0->unk_54 = 8;
    arg0->unk_56 = 8;
    arg0->unk_58 = 8;
    arg0->unk_74 = 4;
    arg0->unk_76 = 4;
    arg0->unk_78 = 4;
    arg0->unk_7C = 5;
    arg0->unk_7E = 5;
    arg0->unk_80 = 5;
    rot[1] = 0;
    rot[2] = arg0->unk_06;
    arg0->unk_18 = D_8006A7E0[arg0->unk_0A].unk_00;
    pos[2] = D_8006A7E0[arg0->unk_0A].unk_04;
    rot[0] = D_8006A7E0[arg0->unk_0A].unk_08;
    switch (arg0->unk_0A) {
    case 1:
        arg0->unk_18 = 0x1100000;
        rot[0] = 0x564;
        pos[2] = 0x8C0000;
        break;
    case 2:
        arg0->unk_18 = 0x1500000;
        rot[0] = 0x546;
        pos[2] = 0x8C0000;
        break;
    case 3:
    case 5:
        arg0->unk_18 = 0x1500000;
        rot[0] = 0x546;
        pos[2] = 0x8C0000;
        break;
    case 4:
        arg0->unk_18 = 0xC00000;
        rot[0] = 0x564;
        pos[2] = 0x8C0000;
        break;
    case 6:
        if (arg0->unk_98 == 1) {
            arg0->unk_18 += 0xC00000;
        } else if (arg0->unk_98 == 0) {
            arg0->unk_18 += -0x600000;
        }
        func_800A6C48(arg0);
    case 0:
    case 12:
        rot[0] = 0x564;
        pos[2] = 0x8C0000;
        break;
    case 8:
        arg0->unk_18 = 0x800000;
        rot[0] = 0x578;
        if (D_80088090->unk_206 & 0x100) {
            rot[2] = 0x400;
        } else {
            rot[2] = 0xC00;
        }
        pos[2] = 0x500000;
        break;
    }
    func_800B9274(rot[2], pos, arg0->unk_18);
    if (func_8000C8EC(arg0->unk_14) != 0) {
        pos[0] = arg0->unk_0C->unk_1C + pos[0];
        pos[1] = arg0->unk_0C->unk_20 + pos[1] + arg0->unk_18 / 8;
    } else {
        pos[0] = arg0->unk_0C->unk_1C - pos[0];
        pos[1] = arg0->unk_0C->unk_20 - pos[1] + arg0->unk_18 / 8;
    }
    func_800A2E58(arg0, pos);
    func_800A2EB4(arg0, rot);
}
