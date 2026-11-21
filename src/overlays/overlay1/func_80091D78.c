#include "types.h"

extern s16 D_800876DC;
extern s32 D_8008808C;
extern u16 D_80087AAC;
extern s32 D_80080C10;
extern s16 D_80088AE4;
extern s8 D_80086DDC[];
extern s16 D_80087758;
extern s16 D_80089354;
extern s16 D_80089320;
extern s16 D_800869D6;
extern s16 D_80085BFE;
extern s16 D_80086CF2;
extern s16 D_80086CB0;

void func_800B7DD8(s32, s32, s32, s32, s32);
void func_800DD6EC(void);
void func_8008DA38(void);
void func_8008E73C(void);
s16 func_8008F318(void);
void func_8008F624(void);
s32 func_80031A1C(s32);
s16 weighted_group_object_count(void);
void func_800A365C(s32);
s16 func_8003CBC8(void);
void func_800416A4(s32);
s16 func_8008F600(void);
s16 func_8003CBB8(void);
void func_8003CE88(s32, s16, s32);
void func_80093110(void);

void func_8008D654(void) {
    s16 n;

    if (D_800876DC == 2 || D_800876DC == 4) {
        if (D_8008808C == 0 && D_80087AAC >= 0x7D && D_80087AAC < 0x8C) {
            D_8008808C = 1;
            func_800B7DD8(2, 0x16, 0, 0, 0);
        }
    }
    func_800DD6EC();
    func_8008DA38();
    if (D_80080C10 & 0x4000) {
        return;
    }
    func_8008E73C();
    if (D_80086DDC[D_80088AE4] != 1) {
        return;
    }
    if (!(D_80080C10 & 0x800)) {
        return;
    }
    if (D_80089354 >= D_80087758) {
        if (D_80089320 != -1) {
            if (!(D_80080C10 & 2)) {
                if (func_8008F318() == 0) {
                    D_80089354 = D_80087758 - 1;
                } else {
                    func_8008F624();
                }
            } else {
                D_80089354 = -1;
            }
        } else {
            if (!(D_80080C10 & 4)) {
                if (func_8008F318() != 0) {
                    func_8008F624();
                } else {
                    D_80089354 = D_80087758;
                }
            } else {
                D_80089354 = -1;
            }
        }
    } else if (D_800869D6 >= D_80087758) {
        D_800869D6 = D_80087758 - 1;
        if (func_8008F318() != 0) {
            if (D_80089354 == 0) {
                n = (s16) (D_80087758 - 1) - func_80031A1C((D_80080C10 & 0x20) ? 2 : 7);
                if (n <= 0) {
                    n = 1;
                }
                if ((D_80080C10 & 0x1200) == 0x1200) {
                    n = 2;
                }
                D_80089354 = n;
            }
            if (D_80089320 != -1) {
                if (weighted_group_object_count() < 2) {
                    D_800869D6 = -1;
                    D_80085BFE = 0x3C;
                    if (D_80086CF2 != 3) {
                        func_800A365C(0);
                    }
                    if (func_8003CBC8() == 0) {
                        func_800416A4(9);
                    }
                }
            } else if (weighted_group_object_count() == 0) {
                if (func_8008F600() == 0) {
                    D_800869D6 = -1;
                    func_8003CE88(0x17, func_8003CBB8() * 10 + 0x57, 0x10);
                }
            }
        }
    }
    D_80086CB0--;
    if (D_800869D6 < 0) {
        n = --D_80085BFE;
        if (n < 0) {
            D_80085BFE = func_80031A1C(0x28) + 0x3C;
            if (!(D_80080C10 & 0x100)) {
                func_80093110();
            }
        } else if (D_80089320 != -1 && !(D_80080C10 & 2)) {
            if (n != 0 && !(n & 0x1F)) {
                func_800416A4(0xA);
            }
        }
    }
}
