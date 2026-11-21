#include "types.h"

typedef struct {
    u8 pad00[0xA];
    u16 unk_0A;
    u8 pad0C[0x44 - 0xC];
    s16 unk_44;
    s16 unk_46;
    u16 unk_48[2];
    u16 unk_4C[2];
    u16 unk_50;
    u8 pad52[2];
    u16 unk_54;
    u16 unk_56;
    s16 unk_58;
    s16 unk_5A;
} Coin;

typedef struct {
    u8 unk_00;
    u8 pad01[0x214C - 1];
} Team;

extern u16 D_80071950[];
extern Team D_80080CFA[];

void func_800259E4(u16, s32, s32);
u16 func_80031A1C(s32);
s16 overlay5_return_zero();

void func_800C7A0C(Coin *arg0) {
    s32 limit;

    switch (D_80071950[arg0->unk_0A]) {
        case 0:
            arg0->unk_50 = 0;
            arg0->unk_56 = 0;
            arg0->unk_44 = 0x14;
            arg0->unk_5A = 0;
            arg0->unk_0A++;
            break;
        case 2:
            arg0->unk_50 = 1;
            arg0->unk_56 = 0;
            arg0->unk_44 = 0x14;
            arg0->unk_5A = 0;
            arg0->unk_0A++;
            break;
        case 1:
            switch (arg0->unk_56) {
                case 0:
                    arg0->unk_44 = 0x14;
                    arg0->unk_5A = 0;
                    break;
                case 5:
                    if (func_80031A1C(100) < 5) {
                        arg0->unk_56 = 6;
                    }
                    break;
                default:
                    if (arg0->unk_54 < 4) {
                        limit = D_80080CFA[arg0->unk_50].unk_00 - 0x2D;
                        if (limit <= 0) {
                            limit = 0xA;
                        }
                        if (func_80031A1C(0x100) < limit) {
                            arg0->unk_56 = 2;
                        } else {
                            arg0->unk_56 = 1;
                        }
                        if (arg0->unk_54 == 3) {
                            func_800259E4(arg0->unk_50, 4, 1);
                        }
                        arg0->unk_58 = overlay5_return_zero();
                    } else if (arg0->unk_46 != 1 && arg0->unk_44 < 0) {
                        if (arg0->unk_44 < -10) {
                            arg0->unk_56 = 4;
                        } else if (func_80031A1C(100) < 0x33) {
                            arg0->unk_56 = 3;
                        } else {
                            arg0->unk_56 = 4;
                        }
                    } else if (arg0->unk_44 < 10 &&
                               arg0->unk_4C[arg0->unk_50] + arg0->unk_48[arg0->unk_50] -
                                       arg0->unk_48[arg0->unk_50 ^ 1] - arg0->unk_4C[arg0->unk_50 ^ 1] < 0 &&
                               func_80031A1C(100) >= 0x37) {
                        arg0->unk_56 = 2;
                        arg0->unk_58 = overlay5_return_zero(arg0->unk_50);
                        func_800259E4(arg0->unk_50, 6, 1);
                    } else {
                        arg0->unk_56 = 3;
                    }
                    break;
            }
            break;
    }
    if (arg0->unk_56 == 2) {
        func_800259E4(arg0->unk_50, 0x15, 1);
    }
    if (arg0->unk_56 == 1) {
        func_800259E4(arg0->unk_50, 0x16, 1);
    }
}
