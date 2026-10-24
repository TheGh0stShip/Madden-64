#include "types.h"

extern s16 D_80089320;
extern s32 D_80084F34;
extern u8 D_80088AF2;

void func_800297A4(void) {
    if (D_80089320 > 0 && D_80084F34 > 0x1DFFFFF) {
        D_80088AF2 = 1;
    }
}
