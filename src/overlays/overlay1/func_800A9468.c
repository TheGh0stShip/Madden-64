#include "types.h"

typedef struct {
    s32 unk_00;
    u8 pad04[0x1C - 0x4];
    s32 unk_1C;
    s32 unk_20;
} Body;

typedef struct {
    u8 pad00[0x6];
    s16 unk_06;
    u8 pad08[0xA - 0x8];
    s16 unk_0A;
    Body *unk_0C;
    u8 pad10[0x14 - 0x10];
    s32 unk_14;
    s32 unk_18;
    u8 pad1C[0x4C - 0x1C];
    s16 unk_4C;
    s16 unk_4E;
    s16 unk_50;
    u8 pad52[0x54 - 0x52];
    s16 unk_54;
    s16 unk_56;
    s16 unk_58;
    u8 pad5A[0x74 - 0x5A];
    s16 unk_74;
    s16 unk_76;
    s16 unk_78;
    u8 pad7A[0x7C - 0x7A];
    s16 unk_7C;
    s16 unk_7E;
    s16 unk_80;
    u8 pad82[0x98 - 0x82];
    s32 unk_98;
} Actor;

typedef struct {
    s32 unk_00;
    s32 unk_04;
    u16 unk_08;
} Entry;

typedef struct {
    s32 x;
    s32 y;
    s32 z;
} Vec;

typedef struct {
    u16 unk_00;
    u16 unk_02;
    s16 unk_04;
} Info;

extern Entry D_8006A7E0[];
void func_800A6C48(Actor *a);
void func_800B9274(s16 a, Vec *v, s32 c);
s32 func_8000C8EC(s32 a);
void func_800A2E58(Actor *a, Vec *v);
void func_800A2EB4(Actor *a, Info *i);

void func_800A4D44(Actor *arg0) {
    Vec pos;
    Info info;

    arg0->unk_50 = arg0->unk_4E = arg0->unk_4C = 4;
    arg0->unk_58 = arg0->unk_56 = arg0->unk_54 = 8;
    arg0->unk_78 = arg0->unk_76 = arg0->unk_74 = 4;
    arg0->unk_80 = arg0->unk_7E = arg0->unk_7C = 5;
    info.unk_02 = 0;
    info.unk_04 = arg0->unk_06;
    arg0->unk_18 = D_8006A7E0[arg0->unk_0A].unk_00;
    pos.z = D_8006A7E0[arg0->unk_0A].unk_04;
    info.unk_00 = D_8006A7E0[arg0->unk_0A].unk_08;
    switch (arg0->unk_0A) {
    case 1:
        arg0->unk_18 = 0x1400000;
        pos.z = 0xBE0000;
        info.unk_00 = 0x596;
        break;
    case 2:
        arg0->unk_18 = 0x1800000;
        pos.z = 0xBE0000;
        info.unk_00 = 0x56E;
        break;
    case 3:
    case 5:
        arg0->unk_18 = 0x1C00000;
        pos.z = 0xBE0000;
        info.unk_00 = 0x550;
        break;
    case 4:
        arg0->unk_18 = 0xE00000;
        pos.z = 0xBE0000;
        info.unk_00 = 0x596;
        break;
    case 6:
        func_800A6C48(arg0);
    case 0:
    case 12:
        arg0->unk_18 = 0xE00000;
        if (arg0->unk_0A == 6) {
            if (arg0->unk_98 == 1) {
                arg0->unk_18 = 0x1E00000;
            } else if (arg0->unk_98 == 0) {
                arg0->unk_18 = 0x200000;
            }
        }
        pos.z = 0xBE0000;
        break;
    }
    func_800B9274(info.unk_04, &pos, arg0->unk_18);
    if (func_8000C8EC(arg0->unk_14)) {
        pos.x = arg0->unk_0C->unk_1C + pos.x;
        pos.y = arg0->unk_0C->unk_20 + pos.y + arg0->unk_18 / 8;
        if (arg0->unk_0A == 6) {
            if (arg0->unk_98 == 0) {
                pos.y += 0x800000;
            } else if (arg0->unk_98 == 1) {
                pos.y += (s32)0xFFA00000;
            }
        }
    } else {
        pos.x = arg0->unk_0C->unk_1C - pos.x;
        pos.y = arg0->unk_0C->unk_20 - pos.y + arg0->unk_18 / 8;
        if (arg0->unk_0A == 6) {
            if (arg0->unk_98 == 0) {
                pos.y += (s32)0xFF800000;
            } else if (arg0->unk_98 == 1) {
                pos.y += 0x600000;
            }
        }
    }
    func_800A2E58(arg0, &pos);
    func_800A2EB4(arg0, &info);
}
