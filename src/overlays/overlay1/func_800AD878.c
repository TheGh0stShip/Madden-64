#include "types.h"

extern s32 D_8006B538;
extern s32 D_8006B558;
extern u16 D_8006B7A8;
extern u16 D_8006B7B8;
extern u16 D_8006B7BA;
extern s8 D_8006B7C4;
extern s32 D_8006B884;
extern s32 D_8006B88C;
extern s32 D_8007A0CC;
extern s32 D_8007A108;
extern s32 D_8007A10C;
extern s32 D_8007A110;
extern s32 D_8007A114;
extern s32 *D_8007A120;
extern s32 *D_8007A124;
extern s32 *D_8007A13C;
extern s32 *D_8007A140;
extern s16 D_8007A148;
extern s16 D_8007A14A;
extern s16 D_8007A154;
extern s16 D_8007A156;
extern u16 D_8007A158;
extern u16 D_8007A15A;
extern s16 D_8007A160;
extern s16 D_8007A168;
extern s32 D_80080C8C;
extern s32 D_80085BF0[];
extern s32 D_800861C0;
extern s32 D_800886D8[];
extern s16 D_80088AE4;
extern s32 D_80089290[];

void func_8000BF08(void);
void func_8000D684(s32);
void func_8000D874(s32, s32);
void func_8000DA98(s32);
void func_80032F3C(s32, s32);

void func_800AD878(void) {
    u32 i;

    if (D_8006B7A8 != 3) {
        D_8007A13C = &D_8006B558;
        D_8007A120 = &D_8006B558;
        D_8007A140 = &D_8006B538;
        D_8007A124 = &D_8006B538;
        D_8007A160 = 0x5A;
        D_8007A14A = 0;
        D_8007A148 = 0;
        D_8007A156 = 0;
        D_8007A154 = 0;
        D_8006B7C4 = 0x35;
    }
    if (D_80088AE4 == 1) {
        D_8006B7B8 = D_8007A158;
        D_8006B7BA = D_8007A15A;
    } else {
        D_8006B7B8 = D_8007A15A;
        D_8006B7BA = D_8007A158;
    }
    func_8000D874(D_8006B884, D_8006B88C);
    func_8000BF08();
    func_8000DA98(D_8006B88C);
    func_8000D684(D_8007A0CC);
    for (i = 0; i < 2; i++) {
        func_80032F3C(0, D_80085BF0[i]);
        func_80032F3C(0, D_80089290[i]);
        func_80032F3C(0, D_800886D8[i]);
    }
    func_80032F3C(0, D_80080C8C);
    func_80032F3C(0, D_800861C0);
    D_8007A10C = 0;
    D_8007A108 = 0;
    D_8007A114 = 0;
    D_8007A110 = 0;
    D_8007A168 = 0;
}
