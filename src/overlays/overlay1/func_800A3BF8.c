#include "types.h"

typedef struct {
    u8 pad00[0x1C];
    s32 x;
    s32 z;
} FieldPos;

typedef struct {
    u8 pad00[0x1F];
    u8 side;
    u8 pad20[4];
    FieldPos *obj;
    u8 pad28[0x70];
    s32 unk_98;
} Kicker;

extern s32 D_80080C10;
extern FieldPos *D_80086178;
extern s16 D_80089320;
extern s32 D_80088090;
extern s16 D_80085112[8];
extern s8 D_80069E74[];

s32 func_8000C8EC(s32 arg0);
void func_8009EFAC(Kicker *kicker);
void object_resource_prepare(Kicker *kicker, s32 arg1);
void func_800C0018(Kicker *kicker, s16 angle, s32 arg2);

void func_800A3BF8(Kicker *kicker) {
    s32 scores[8];
    s32 x0;
    s32 z1;
    s32 x1;
    s32 z0;
    s32 side;
    s32 i;
    s32 d;
    s32 f;
    s32 limit;
    s32 min;
    s32 best;
    s32 dir;

    x0 = 0;
    x1 = 0;
    z0 = 0;
    z1 = 0;
    side = kicker->side;
    if (D_80080C10 & 1) {
        switch (side) {
            case 0:
                side = 1;
                break;
            case 1:
                side = 0;
                break;
        }
    }
    switch (side) {
        case 0:
            z0 = D_80086178->z - 0x1400000;
            z1 = D_80086178->z - 0xF00000;
            if (z0 < -0x4000000) {
                z0 = -0x4000000;
                z1 = -0x3E00000;
            }
            x0 = D_80086178->x + 0xC00000;
            x1 = D_80086178->x + 0x1200000;
            break;
        case 1:
            if (D_80089320 != -1) {
                x0 = D_80086178->x - 0x800000;
                x1 = D_80086178->x - 0x400000;
                if (x0 < -0x1900000) {
                    x0 = -0x1900000;
                    x1 = -0x1700000;
                }
                z0 = D_80086178->z + 0xC00000;
                z1 = D_80086178->z + 0x1200000;
                if (z1 > 0x4000000) {
                    z0 = 0x3E00000;
                    z1 = 0x4000000;
                }
            } else {
                x0 = D_80086178->x - 0x400000;
                x1 = D_80086178->x + 0x400000;
                z0 = D_80086178->z + 0x1000000;
                z1 = D_80086178->z + 0x1800000;
            }
            break;
        case 2:
            if (func_8000C8EC(D_80088090) == 0) {
                x0 = 0x1600000;
                x1 = 0x1A00000;
                z0 = D_80086178->z - 0x300000;
                z1 = D_80086178->z + 0xA00000;
            } else {
                x0 = -0x1D00000;
                x1 = -0x1800000;
                z0 = D_80086178->z - 0x400000;
                z1 = D_80086178->z + 0xA00000;
            }
            break;
        case 3:
            if (func_8000C8EC(D_80088090) != 0) {
                x0 = 0x1600000;
                x1 = 0x1A00000;
                z0 = D_80086178->z - 0x300000;
                z1 = D_80086178->z + 0xA00000;
            } else {
                x0 = -0x1D00000;
                x1 = -0x1800000;
                z0 = D_80086178->z - 0x400000;
                z1 = D_80086178->z + 0xA00000;
            }
            break;
    }
    for (i = 7; i >= 0; i--) {
        scores[i] = 0;
    }
    limit = -20;
    f = (x0 + ((x1 - x0) >> 1) - kicker->obj->x) >> 21;
    d = (x0 + ((x1 - x0) >> 1) - kicker->obj->x) >> 22;
    scores[5] -= d;
    scores[7] -= d;
    scores[1] += d;
    scores[6] -= f;
    scores[2] += f;
    scores[3] += d;
    f = (z0 + ((z1 - z0) >> 1) - kicker->obj->z) >> 21;
    d = (z0 + ((z1 - z0) >> 1) - kicker->obj->z) >> 22;
    scores[3] -= d;
    scores[5] -= d;
    scores[7] += d;
    scores[4] -= f;
    scores[0] += f;
    scores[1] += d;
    if (D_80080C10 & 0x4000) {
        limit = -5;
    }
    func_8009EFAC(kicker);
    if (kicker->obj->x >= x0 && kicker->obj->x <= x1 && kicker->obj->z >= z0 && kicker->obj->z <= z1) {
        kicker->unk_98 = 1;
        min = 1000;
        for (i = 0; i < 8; i++) {
            if (D_80085112[i] < min) {
                min = D_80085112[i];
            }
        }
        D_80069E74[kicker->side] = -100;
        if (min < limit) {
            best = -1000000;
            dir = -1;
            do {
                for (i = 0; i < 8; i++) {
                    if (limit < D_80085112[i] && best < scores[i]) {
                        dir = i;
                        best = scores[i];
                    }
                }
                limit -= 5;
            } while (dir == -1);
        } else {
            object_resource_prepare(kicker, 0x41);
            return;
        }
    } else {
        kicker->unk_98 = 0;
        if (!(D_80080C10 & 0x4000)) {
            f = (x0 - kicker->obj->x) >> 21;
            d = f / 2;
            D_80085112[5] -= d;
            D_80085112[6] -= f;
            D_80085112[7] -= d;
            D_80085112[1] += d;
            D_80085112[2] += f;
            D_80085112[3] += d;
            f = (x1 - kicker->obj->x) >> 21;
            d = f / 2;
            D_80085112[1] += d;
            D_80085112[2] += f;
            D_80085112[3] += d;
            D_80085112[5] -= d;
            D_80085112[6] -= f;
            D_80085112[7] -= d;
            f = (z0 - kicker->obj->z) >> 21;
            d = f / 2;
            D_80085112[3] -= d;
            D_80085112[4] -= f;
            D_80085112[5] -= d;
            D_80085112[7] += d;
            D_80085112[0] += f;
            D_80085112[1] += d;
            best = -1000000;
            dir = -1;
            f = (z1 - kicker->obj->z) >> 21;
            d = f / 2;
            D_80085112[7] += d;
            D_80085112[0] += f;
            D_80085112[1] += d;
            D_80085112[3] -= d;
            D_80085112[4] -= f;
            D_80085112[5] -= d;
            do {
                for (i = 0; i < 8; i++) {
                    if (limit < D_80085112[i] && best < scores[i]) {
                        dir = i;
                        best = scores[i];
                    }
                }
                limit -= 5;
            } while (dir == -1);
        } else {
            min = 1000;
            dir = -1;
            for (i = 0; i < 8; i++) {
                if (D_80085112[i] < min) {
                    dir = i;
                    min = D_80085112[i];
                }
            }
            if (dir >= 4) {
                dir -= 4;
            } else {
                dir += 4;
            }
            if (limit < min) {
                best = -1000000;
                for (i = 0; i < 8; i++) {
                    if (best < scores[i]) {
                        dir = i;
                        best = scores[i];
                    }
                }
            }
        }
    }
    func_800C0018(kicker, dir << 9, 0);
    D_80069E74[kicker->side] = dir;
}
