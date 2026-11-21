#include "types.h"

typedef struct {
    u8 pad0[0x1C];
    s32 unk_1C;
    s32 unk_20;
} Ball;

typedef struct {
    u8 pad0[0x20];
    u8 unk_20;
    u8 pad21[3];
    Ball *unk_24;
    u16 unk_28;
    u8 pad2A[0x8C - 0x2A];
    s32 unk_8C;
    s32 unk_90;
    s32 unk_94;
    s32 unk_98;
    s32 pad9C;
    s32 unk_A0;
    s32 unk_A4;
} Obj;

u16 func_80031A1C(s32);
extern s16 D_8006B7AA;
extern s32 D_80080C10;
typedef struct { s32 x; s32 z; } Pos;
extern Pos D_80084F30;
extern s32 D_80087B60;

s32 func_800D03DC(Obj *arg0) {
    s32 pos;

    if (!(arg0->unk_28 & 1)) {
        arg0->unk_A0 = -1;
        arg0->unk_98 = 0;
        arg0->unk_94 = 0;
        if (arg0->unk_24->unk_1C >= 0) {
            arg0->unk_A4 = 20;
        } else {
            arg0->unk_A4 = -20;
        }
        if (arg0->unk_20 == 7) {
            if (func_80031A1C(10) < 5) {
                arg0->unk_A4 = 20;
            } else {
                arg0->unk_A4 = -20;
            }
        }
    }
    pos = arg0->unk_20;
    if (pos < 9) {
        if (pos < 6) {
            arg0->unk_8C = 0x9999;
        } else {
            arg0->unk_8C = 0x6666;
        }
    } else {
        arg0->unk_8C = 0x9999;
    }
    arg0->unk_90 = 0x7FFFFFFF;
    arg0->unk_94 = 1;
    if (D_80084F30.z - arg0->unk_24->unk_20 <= 0x300000) {
        arg0->unk_90 = D_80084F30.x - arg0->unk_24->unk_1C;
        if (arg0->unk_90 < 0) {
            arg0->unk_90 = -arg0->unk_90;
        }
        if (!(D_80080C10 & 0x100)) {
            arg0->unk_90 = arg0->unk_24->unk_20 - arg0->unk_90 / 4 - 0x80000;
        } else if (D_8006B7AA == 18) {
            arg0->unk_90 = arg0->unk_24->unk_20 - arg0->unk_90 / 8 - 0x80000;
        } else {
            arg0->unk_90 = arg0->unk_24->unk_20 - arg0->unk_90 / 5 - 0x80000;
        }
    }
    D_80087B60 = 0x2E0003;
    return 0;
}
