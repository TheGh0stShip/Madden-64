#include "types.h"

typedef struct {
    s32 unk0;
} AngleB751C;

typedef struct {
    u8 pad0[0x1E];
    u8 unk1E;
} PlayerB751C;

typedef struct {
    u8 pad0[0x1C];
    s32 unk1C;
} BallB751C;

typedef struct {
    u8 pad0[0x24];
    s32 unk24;
} FieldB751C;

typedef struct {
    u8 pad0[0x2C];
    s32 unk2C;
    s32 unk30;
    s32 unk34;
    u8 pad38[0x2C];
    s16 unk64;
    u8 pad66[2];
    s16 unk68;
    u8 pad6A[0x2E];
    s32 unk98;
} ViewB751C;

extern void func_800A5DF8(s32 *, s32 *, s32, s32);

extern s32 D_8007A210;
extern AngleB751C D_8007A218;
extern s32 D_8007A220;
extern s32 D_8007A224;
extern s32 D_8007A228;
extern s32 D_8007A22C[3];
extern s32 D_8007A23C;
extern s32 D_8007A240;
extern FieldB751C *D_80086178;
extern BallB751C *D_8008A5EC;
extern PlayerB751C *D_8008B368;

void func_800B751C(ViewB751C *view) {
    PlayerB751C *player;
    s32 speed;
    s32 limit;
    s32 shift;
    s32 angle;

    if (D_8007A228 != 3) {
        func_800A5DF8(&view->unk2C, D_8007A22C, 4, 4);
        D_8007A22C[0] = view->unk2C;
        D_8007A22C[1] = view->unk30;
        D_8007A22C[2] = view->unk34;
        player = D_8008B368;
        if (player != 0) {
            view->unk98 = D_8007A240;
            if (D_8007A224 != player->unk1E && D_8007A228 != 1) {
                D_8007A218.unk0 = (D_8007A218.unk0 + 0x800) & 0xFFF;
                D_8007A224 = player->unk1E;
            }
        } else if (D_8007A228 != 1) {
            view->unk98 = D_80086178->unk24 + D_8007A240;
            limit = view->unk98;
            if (limit < D_8007A240) {
                limit = D_8007A240;
            }
            view->unk98 = limit;
            if (limit > 0x1E00000) {
                limit = 0x1E00000;
            }
            view->unk98 = limit;
        }
        speed = D_8008A5EC->unk1C;
        shift = D_8007A23C;
        angle = D_8007A218.unk0;
        if (speed >= 0) {
            speed = angle + (speed >> shift) * D_8007A220;
        } else {
            speed = angle + (-speed >> shift) * D_8007A220;
        }
        view->unk68 = speed;
        switch (D_8007A228) {
        case 0:
        case 1:
        case 2:
        case 4:
        case 5:
            view->unk64 = D_8007A210;
            break;
        case 3:
            break;
        }
    }
}
