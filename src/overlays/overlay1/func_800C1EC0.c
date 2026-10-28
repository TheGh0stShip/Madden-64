#include "types.h"

#ifndef NULL
#define NULL 0
#endif

extern u8 *D_800880F0[];
s32 func_800BD854(s16, u8, s32);            /* extern */
s32 func_800BDAE8(u16);                             /* extern */
extern s32 D_80080C10;
extern s16 D_80089320;
extern s16 D_80089340;
extern u8 D_8008951A;
extern u16 D_8008A5B2;
extern u8 D_8008AFC6;

void func_800C1EC0(s16 arg0) {
    if ((func_800BDAE8(arg0) != 0) && ((D_8008AFC6 == 0) || (D_80089320 == -1) || (D_8008951A == 0) || (D_80089340 == 3) || (D_8008A5B2 == 3)) && (D_80080C10 & 2)) {
        func_800BD854(arg0, D_800880F0[arg0][0x1E], 0);
    }
}
