#include "types.h"

typedef struct {
    u8 pad_00[0x14];
    s32 unk_14;
    u8 pad_18[0x4];
    s32 unk_1C;
    s32 unk_20;
    s32 unk_24;
    u8 pad_28[0x4];
    s32 unk_2C;
    s32 unk_30;
    s32 unk_34;
} Res;

typedef struct {
    u8 pad_00[0x1F];
    u8 unk_1F;
    u8 pad_20[0x4];
    Res *unk_24;
    u16 unk_28;
    u8 pad_2A[0x72];
    s32 unk_9C;
} Obj;

typedef struct {
    Res *unk_00;
    u8 pad_04[0xAC];
} Team;

extern s32 D_80080C10;
extern s16 D_800857F0;
extern Team D_8008715C[];
extern Res *D_800886E4;
extern volatile u16 D_8008A5B4;
void func_800B7DD8(s32, s32, s32, s32, s32);
void object_resource_prepare(Obj *, s32);
u16 three_stage_value_update(void *, u16);

s32 func_800A16AC(Obj *arg0) {
    if (arg0->unk_9C != 0) {
        if (arg0->unk_24->unk_14 & 0x40000) {
            arg0->unk_9C = 2;
            arg0->unk_24->unk_14 &= ~0x40000;
            arg0->unk_28 |= 0x20;
            D_800886E4->unk_14 |= 0x31;
            D_800886E4->unk_1C = D_8008715C[arg0->unk_1F].unk_00->unk_1C;
            D_800886E4->unk_20 = D_8008715C[arg0->unk_1F].unk_00->unk_20 - 1;
            D_800886E4->unk_24 = 0x100000;
            D_800886E4->unk_2C = 0x8000;
            D_800886E4->unk_30 = -0x8000;
            D_800886E4->unk_34 = 0x8000;
            if ((D_80080C10 & 0x4000) && D_800857F0 == 0) {
                func_800B7DD8(2, 0x12, 0, 0, 0);
            }
        }
        if (arg0->unk_9C == 2) {
            three_stage_value_update(D_800886E4, D_8008A5B4);
        }
        if (D_800886E4->unk_24 != 0) {
            return 0;
        }
        goto prepare;
    }
    if (!(arg0->unk_24->unk_14 & 0x20000)) {
    prepare:
        object_resource_prepare(arg0, 0x41);
        return 1;
    }
    return 0;
}
