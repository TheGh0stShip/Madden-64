#include "types.h"

extern s32 D_800717F0;
extern s32 D_80087910;
extern s32 D_800861B8;
extern s32 D_800861BC;
extern s16 D_8008794A;
extern s32 D_80088500;
extern s16 D_80088470;
extern s16 D_8008799C;
extern s16 func_80031A1C(s32 id);

void func_800E23F8(void) {
    D_800717F0 = 0xFE2C0000;
    D_80087910 = 0;
    D_800861B8 = 0;
    D_800861BC = 0;
    D_8008794A = 0;
    D_80088500 = 0;
    D_80088470 = 0;
    D_8008799C = func_80031A1C(0xC);
}
