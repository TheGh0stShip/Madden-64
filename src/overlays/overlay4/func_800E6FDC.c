#include "types.h"

extern s16 D_800892B6;
extern s16 D_800892B4;
extern s32 D_80089494;
extern s32 D_80089498;
extern s16 D_8008959A;
extern s32 D_80089490;
extern s16 D_80089598;
extern u8 D_80087A6A;
extern s16 D_8008A5B0;
extern void func_80039674(void);
extern void func_8003E510(s32 x, s32 y, s32 arg2, s32 arg3);
extern void func_800396E0(s32 mode);

void func_800E6FDC(void) {
    func_80039674();
    func_8003E510(D_800892B6, D_800892B4, 0, 0);
    func_800396E0(1);
    D_80089494 = 1;
    D_80089498 = -1;
    D_8008959A = 1;
    D_80089490 = 0;
    D_80089598 = 0;
    D_80087A6A = 0;
    D_8008A5B0 = 2;
}
