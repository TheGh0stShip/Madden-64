#include "types.h"

typedef struct { u8 pad[0x14]; s32 unk14; u8 pad18[4]; s32 unk1C; s32 unk20; u8 pad24[8]; s32 unk2C; s32 unk30; } Sub;
typedef struct Obj { u8 pad[0x24]; Sub *unk24; u8 pad28[4];
    union { s32 w; u8 b[4]; } unk2C;
    u8 pad30[0x65-0x30]; u8 unk65; u8 pad66[0x8C-0x66]; s32 unk8C; s32 unk90; } Obj;
extern u16 func_80031A1C(s32);
extern void func_800C0BBC(Obj *, s32);
extern void func_800C0D00(Obj *, s32);
extern void func_800C16A0(Obj *, s32);
extern s16 func_800DB7D4(Obj *);
extern void func_800E1C98(void);
extern s32 D_80080C10;
typedef struct { s32 x; s32 y; } Pos2;
extern Pos2 D_80084F30;
extern s16 D_80089320;
extern s16 D_800894FC;
extern volatile u16 D_8008A5B4;
extern s32 D_80069E10[3];
extern s32 D_80069E1C[3];

s32 func_800DA408(Obj *arg0) {
    s32 id = -1;
    s32 dy;
    s32 c;
    Sub *sp;

    if (D_800894FC != 0) {
        func_800E1C98();
        return 1;
    }
    arg0->unk24->unk14 |= 0x200;
    if (arg0->unk24->unk14 & 0x20000) {
        return 0;
    }
    c = arg0->unk2C.b[1];
    if (c == 0x2B || c == 0x2C) {
        goto skip;
    }
    if (c == 0x2D) {
    skip:
        if (arg0->unk65 < 2) {
            arg0->unk65 = 0xFF;
        }
        return 0;
    }
    if (D_80089320 != -1) {
        arg0->unk8C -= D_8008A5B4;
        if (arg0->unk8C < 0 || arg0->unk24->unk2C != 0 || arg0->unk24->unk30 != 0) {
            arg0->unk8C = 2;
            if (!func_800DB7D4(arg0)) {
                return 0;
            }
            if (arg0->unk24->unk2C | arg0->unk24->unk30) {
                return 0;
            }
            if (!(D_80080C10 & 0x100) && !func_80031A1C(0x5A)) {
                if (arg0->unk24->unk1C - D_80084F30.x < 0) {
                    id = D_80069E10[func_80031A1C(3)];
                } else {
                    id = D_80069E1C[func_80031A1C(3)];
                }
                func_800C16A0(arg0, 0x800);
            }
        } else if ((u32)(arg0->unk2C.w - 0x1E) < 2) {
            return 0;
        }
    }
    if (arg0->unk24->unk2C | arg0->unk24->unk30) {
        arg0->unk90 = 10;
        return 0;
    }
    arg0->unk90 -= D_8008A5B4;
    if (arg0->unk90 < 0) {
        arg0->unk90 = 10;
        sp = arg0->unk24;
        dy = sp->unk1C - D_80084F30.x;
        if ((u32)(dy + 0x7FFFFF) <= 0xFFFFFE) {
            dy = sp->unk20 - D_80084F30.y;
            if (dy < 0) {
                return 0;
            }
            if (dy <= 0x1E0000) {
                id = -1;
                if (func_80031A1C(100) < 50) {
                    func_800C0D00(arg0, 0x2B);
                } else {
                    func_800C0D00(arg0, 0x2C);
                }
                func_800C16A0(arg0, 0x800);
            }
        }
    }
    if (id >= 0) {
        func_800C0BBC(arg0, id);
    }
    return 0;
}
