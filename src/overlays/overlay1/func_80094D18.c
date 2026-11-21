#include "types.h"

typedef struct {
    u8 pad00[0x10C];
    void *unk_10C;
    void *unk_110;
    u8 pad114[4];
    s16 unk_118;
    u8 pad11A[0x214C - 0x11A];
} Team;

extern s16 D_800892D0;
extern u32 D_80080C10;
extern u16 D_8006B7A8;
extern s16 D_800894FC;
extern s16 D_800892C8;
extern s16 D_80087AAC;
extern s16 D_80089320;
extern s16 D_80088074;
extern s8 D_80089356;
extern s32 D_8008793C;
extern s16 D_80084F34[];
extern s16 D_80088AE4;
extern s16 D_800886E0;
extern Team D_80082CA8[];
extern u8 D_8006AE48[];
extern u8 D_8006AECC[];
extern u8 D_8006AEF4[];
extern u8 D_8006AF78[];
extern u8 D_800C31E0[][0x18C];
extern u8 D_80072EE0[][0x78];
extern u8 D_80086DDC[];
extern u16 D_8008B672;
extern s32 D_80085040[];
extern s32 D_800880F0[];
void func_800BEF34(void);
void func_800AD404(void);
void secondary_handle_release(void);
void object_list_apply(void);
void func_800DC50C(void);
void func_800BC98C(void);
void func_800DD6EC(void);
void func_80092B94(void);
s32 func_800B932C(s16, s32);
s32 func_800B93D0(s16);
void func_800B7DD8(s32, s32, s16, s16, s32);
void func_80022354(u16);
void func_80038150(s32);
void func_800BE784(void);
void func_800BCFAC(void);
void func_800E1EF8(s32);
void object_active_callback_clear(s32);
void func_80091E2C(s16);
void func_800A365C(s32);

void func_800905F4(void) {
    u16 i;
    s32 x;

    func_800BEF34();
    D_800892D0 = 0;
    D_80080C10 &= 0xFFDFE7DE;
    func_800AD404();
    secondary_handle_release();
    object_list_apply();
    func_800DC50C();
    if (D_80080C10 & 0x10) {
        func_800BC98C();
    }
    D_800894FC = 0;
    D_800892C8 = 4;
    if (D_8006B7A8 == 0) {
        if ((D_80080C10 & 0x100000) || D_80087AAC != 0 || D_80089320 == 0) {
            func_800DD6EC();
            func_80092B94();
            D_80088074 = 0;
            if (D_800892D0 == 0) {
                D_8006B7A8 = 1;
                if (D_80089320 > 0 && D_80089356 != 0 && D_8008793C != 0x3200000) {
                    x = (s16)func_800B932C(D_80084F34[0], D_8008793C >> 16);
                    func_800B7DD8(0, D_80089320 - 1, x, func_800B93D0(D_80084F34[0]), 0);
                }
            }
        }
    }
    if (D_800892D0 == 0) {
        D_80082CA8[D_80088AE4].unk_118 = 0;
        func_80022354(D_80088AE4);
        if (D_80089320 != -1) {
            D_80082CA8[D_80088AE4].unk_110 = D_8006AE48;
            D_80082CA8[D_80088AE4].unk_10C = D_8006AECC;
            D_80082CA8[D_800886E0].unk_110 = D_8006AEF4;
            D_80082CA8[D_800886E0].unk_10C = D_8006AF78;
        } else {
            D_80082CA8[D_80088AE4].unk_110 = D_800C31E0[1];
            D_80082CA8[D_80088AE4].unk_10C = D_80072EE0[1];
            D_80082CA8[D_800886E0].unk_110 = D_800C31E0[0];
            D_80082CA8[D_800886E0].unk_10C = D_80072EE0[0];
        }
        D_80086DDC[D_80088AE4] = 2;
        D_80086DDC[D_800886E0] = 2;
        func_80038150(0);
        func_80038150(1);
        func_800BE784();
        func_800BCFAC();
        func_800E1EF8(0);
        func_800E1EF8(1);
        for (i = 0; i < D_8008B672 >> 1; i++) {
            object_active_callback_clear(D_80085040[i]);
            object_active_callback_clear(D_80085040[i + 22]);
        }
        for (i = 0; i < 8; i++) {
            D_800880F0[i] = 0;
        }
    } else {
        func_80038150(0);
        func_80038150(1);
        func_800BE784();
        D_800892C8 = 4;
        for (i = 0; i < D_8008B672 >> 1; i++) {
            object_active_callback_clear(D_80085040[i]);
            object_active_callback_clear(D_80085040[i + 22]);
        }
        for (i = 0; i < 8; i++) {
            D_800880F0[i] = 0;
        }
        func_80091E2C(D_80088AE4);
        func_80091E2C(D_800886E0);
    }
    func_800A365C(0);
}
