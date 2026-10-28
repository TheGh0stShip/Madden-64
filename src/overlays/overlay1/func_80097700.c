#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8009EB14(s16);                         /* extern */
s16 func_800DD28C(s32);                         /* extern */
s16 func_800DD524(s32);                         /* extern */
s32 func_800DD6EC();                            /* extern */
extern s32 D_80080C10;
extern u16 D_80085280;
extern u16 D_800857B2;
extern s16 D_80087AAC;
extern u16 D_80088074;
extern s16 D_800886E0;
extern s16 D_80088AE4;
extern s16 D_80089320;
extern u16 D_8008A5B4;

void func_80097700(void) {
    u16 temp_v0;

    if ((D_80089320 != -1) && !(D_80080C10 & 0x4000) && (D_80087AAC != 0)) {
        temp_v0 = D_80088074 - D_8008A5B4;
        D_80088074 = temp_v0;
        if ((s16)temp_v0 < 0) {
            D_80088074 = 0x3C;
            func_800DD6EC();
            if (!(D_800857B2 & 0xC0) && (func_800DD28C(3) == -2)) {
                func_8009EB14(D_80088AE4);
                D_80080C10 &= ~0x800;
            }
            if (!(D_80085280 & 0xC0) && (func_800DD524(3) == -2)) {
                func_8009EB14(D_800886E0);
                D_80080C10 &= ~0x800;
            }
        }
    }
}
