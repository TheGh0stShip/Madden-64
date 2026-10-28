#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8002FF70(s32);                         /* extern */
s32 func_80030DF0();                                /* extern */
s32 func_80041658();                            /* extern */
s32 func_8008F924();                            /* extern */
s32 func_800AF8E0();                            /* extern */
extern s16 D_800876DC;
extern u16 D_80087A90;
extern u16 D_8008A5B4;

void func_80097BD4(s32 arg0) {
    u16 temp_v0;

    temp_v0 = D_80087A90 + D_8008A5B4;
    D_80087A90 = temp_v0;
    if (((u32) (temp_v0 & 0xFFFF) >= 0x835U) || (func_80030DF0() & 0x1000) || (D_800876DC == 5)) {
        func_8002FF70(arg0);
        func_80041658();
        func_800AF8E0();
        func_8008F924();
    }
}
