#include "types.h"

typedef struct {
    /* 0x00 */ s32 unk_00;
} Scale;

typedef struct {
    /* 0x00 */ u8 pad_00[0x18];
    /* 0x18 */ Scale *scale;
} Stadium;

typedef struct {
    /* 0x00 */ s32 unk_00;
    /* 0x04 */ s32 unk_04;
    /* 0x08 */ s32 unk_08;
    /* 0x0C */ s32 unk_0C;
} Speed;

typedef struct {
    /* 0x000 */ u8 pad_000[0x206];
    /* 0x206 */ u16 flags;
} Owner;

typedef struct {
    /* 0x00 */ u8 pad_00[0x1C];
    /* 0x1C */ s32 x;
    /* 0x20 */ s32 z;
} Target;

typedef struct {
    /* 0x00 */ u8 pad_00[0xC];
    /* 0x0C */ Target *target;
    /* 0x10 */ u8 pad_10[4];
    /* 0x14 */ Owner *owner;
    /* 0x18 */ s32 unk_18;
    /* 0x1C */ u8 pad_1C[0x10];
    /* 0x2C */ s32 unk_2C;
    /* 0x30 */ s32 unk_30;
    /* 0x34 */ s32 unk_34;
    /* 0x38 */ u8 pad_38[0x28];
    /* 0x60 */ u16 unk_60;
    /* 0x62 */ u8 pad_62[2];
    /* 0x64 */ s16 unk_64;
    /* 0x66 */ u8 pad_66[2];
    /* 0x68 */ s16 unk_68;
    /* 0x6A */ u8 pad_6A[6];
    /* 0x70 */ s16 unk_70;
    /* 0x72 */ u8 pad_72[0x16];
    /* 0x88 */ s32 unk_88;
    /* 0x8C */ s32 unk_8C;
    /* 0x90 */ s32 unk_90;
    /* 0x94 */ u8 pad_94[4];
    /* 0x98 */ s32 unk_98;
    /* 0x9C */ s32 unk_9C;
    /* 0xA0 */ u8 pad_A0[4];
    /* 0xA4 */ s32 state;
} Camera;

extern s32 D_800717F4;
extern u8 D_800717F8;
extern s32 D_80071814;
extern Speed D_80071818[];
extern u16 D_800718D8;
extern u16 D_8007A1C8;
extern u16 D_8007A1CC;
extern s16 D_8007A1D0;
extern u32 D_8007A1D4;
extern Stadium *D_800861B8[];
extern u16 D_8008712C;
extern u16 D_8008794A;
extern volatile u16 D_8008A5B4;
extern u16 D_8008AFD4;

void func_8003D464(s32 handle);
u16 func_800E0E24();
void func_800E1320(Camera *cam);

void func_800E2D14(Camera *cam) {
    s16 div;
    s32 v;
    s16 h;

    switch (cam->state) {
    case 0:
        if (D_800717F4 != 0) {
            div = D_800861B8[D_8008794A]->scale->unk_00;
            cam->unk_88 = D_80071818[D_8008712C].unk_00 / div + 1;
            cam->unk_8C = D_80071818[D_8008712C].unk_04 / div;
            if (cam->owner->flags & 0x100) {
                D_8007A1CC = 0x800;
            } else {
                D_8007A1CC = 0;
            }
            cam->unk_90 = D_80071818[D_8008712C].unk_08 / div;
            if (cam->unk_70 < -8 || (D_8008AFD4 != 0 && cam->unk_70 < 8)) {
                cam->unk_90 = -cam->unk_90;
            }
            D_8007A1D4 = 0;
            cam->state = 1;
        }
        break;
    case 1:
    case 3:
        cam->unk_2C = cam->target->x;
        cam->unk_30 = cam->target->z;
        cam->unk_34 = 0x180000;
        cam->unk_9C = 0;
        if (D_800718D8 == 0 || func_800E0E24(D_800718D8) == 0) {
            D_8007A1D4 += D_8008A5B4;
            cam->unk_98 = cam->unk_18 - D_8008A5B4 * cam->unk_8C;
            cam->unk_98 = cam->unk_98 > 0x300000 ? cam->unk_98 : 0x300000;
            cam->unk_98 = cam->unk_98 < 0x3200000 ? cam->unk_98 : 0x3200000;
            cam->unk_64 -= D_8008A5B4 * cam->unk_88;
            cam->unk_64 = cam->unk_64 > 0x400 ? cam->unk_64 : 0x400;
            cam->unk_64 = cam->unk_64 < 0x500 ? cam->unk_64 : 0x500;
            cam->unk_68 = (cam->unk_60 + D_8008A5B4 * cam->unk_90) & 0xFFF;
            if (cam->state == 3) {
                if (cam->unk_90 < 0) {
                    cam->unk_90--;
                    D_8007A1D0 -= (D_8007A1C8 - cam->unk_60) & 0xFFF;
                } else {
                    cam->unk_90++;
                    D_8007A1D0 -= (cam->unk_60 - D_8007A1C8) & 0xFFF;
                }
                if (D_8007A1D0 < 0 || D_800717F8 == 0) {
                    cam->state = 4;
                }
                D_8007A1C8 = cam->unk_60;
            }
            if (D_8007A1D4 > 60 && D_80071814 != 0) {
                func_8003D464(D_80071814);
                D_80071814 = 0;
            }
        } else {
            func_800E1320(cam);
            if (func_800E0E24() == 0) {
                cam->state = 4;
            }
        }
        break;
    case 2:
        cam->state = 3;
        cam->unk_8C = -cam->unk_8C;
        cam->unk_88 = -cam->unk_88 >> 1;
        if (cam->unk_90 < 0) {
            D_8007A1D0 = (cam->unk_60 - D_8007A1CC) & 0xFFF;
        } else {
            D_8007A1D0 = (D_8007A1CC - cam->unk_60) & 0xFFF;
        }
        D_8007A1C8 = cam->unk_60;
        break;
    }
}
