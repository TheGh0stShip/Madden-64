#include "types.h"

typedef struct {
    u8 unk_00[0x8];
    u16 unk_08;
} Anim;

typedef struct {
    u8 unk_00[0x8];
    Anim *unk_08;
    u8 unk_0C[0x14];
    s32 unk_20;
} Obj;

void func_80016FF4(s32);
void func_8001AFA4(Obj *, s32);
s32 func_800A82B0(s32, s32);
extern Obj *D_8007A0FC;
extern Obj *D_8007A100;
extern s32 D_8007A108[];
extern s32 D_8007A110[];
extern s16 D_8007A15C[];
extern volatile u16 D_8008A5B4;

void func_800A8CC0(u16 side) {
    s32 n;
    u16 count;

    count = D_8008A5B4;
    D_8007A15C[side] = 1;
    n = count;
    if (side != 0) {
        if (D_8007A100->unk_08->unk_08 == 0x58) {
            while (n > 0) {
                D_8007A100->unk_20 = func_800A82B0(D_8007A100->unk_20, 0);
                n--;
            }
            return;
        }
        while (n > 0) {
            D_8007A100->unk_20 = func_800A82B0(D_8007A100->unk_20, 0x8C);
            n--;
        }
        if (D_8007A100->unk_20 != 0x8C) {
            return;
        }
        func_8001AFA4(D_8007A100, 0x58);
    } else {
        if (D_8007A0FC->unk_08->unk_08 == 0x50) {
            while (n > 0) {
                D_8007A0FC->unk_20 = func_800A82B0(D_8007A0FC->unk_20, 0);
                n--;
            }
            return;
        }
        while (n > 0) {
            D_8007A0FC->unk_20 = func_800A82B0(D_8007A0FC->unk_20, -0x8C);
            n--;
        }
        if (D_8007A0FC->unk_20 != -0x8C) {
            return;
        }
        func_8001AFA4(D_8007A0FC, 0x50);
    }
    func_80016FF4(D_8007A108[side]);
    func_80016FF4(D_8007A110[side]);
}
