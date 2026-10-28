#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8001EC20(s32, s32);                /* extern */
s32 func_8009C9E8();                            /* extern */
extern s16 D_8006B7A8;
extern s16 D_8006B7C2;
extern s8 D_8006B7C4[];
extern s32 D_8007A100;
extern u16 D_8007A160;
extern s32 D_80080C10;
extern u16 D_8008A5B4;

void func_800AD5AC(void) {
    u16 temp_v0;

    if (D_80080C10 & 0x400) {
        func_8009C9E8();
    }
    if (D_80080C10 & 0x200) {
        D_80080C10 &= ~0x200;
        D_8006B7C2 = 1;
    }
    if (D_8006B7C4[0] == 0x30) {
        func_8001EC20(D_8007A100, 8);
        D_8006B7A8 = 4;
        return;
    }
    if (D_8006B7C4[0] != 0x2D) {
        temp_v0 = D_8007A160 - D_8008A5B4;
        D_8007A160 = temp_v0;
        if ((s16)temp_v0 < 0) {
            func_8001EC20(D_8007A100, 8);
            D_8007A160 += 0x3B;
            D_8006B7C4[0]--;
        }
    }
}
