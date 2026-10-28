#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8000D834(s32, s32);                    /* extern */
s32 func_8000D874(s32, s32);                    /* extern */
s32 func_8001AEA8(s32);                         /* extern */
s32 func_8002FEA4(s32 *, s32, s32); /* extern */
s32 func_8002FF70(s32);                         /* extern */
s32 func_80030DF0();                                /* extern */
s32 func_800AF858();                            /* extern */
s32 func_800B7D98();                            /* extern */
extern s32 D_80086D24;
extern s16 D_800876DC;
extern s32 D_80087990;
extern s32 D_80087A64;
extern u16 D_80087A90;
extern s32 D_800892C4;
extern s32 D_8008931C;
extern u16 D_8008A5B4;
extern s32 D_800934B0;

void func_80097AE0(s32 arg0) {
    u16 temp_v0;

    temp_v0 = D_80087A90 + D_8008A5B4;
    D_80087A90 = temp_v0;
    if (((u32) (temp_v0 & 0xFFFF) >= 0x4B1U) || (func_80030DF0() & 0x1000) || (D_80086D24 == -1) || (D_800876DC == 5)) {
        D_80087A90 = 0;
        func_800B7D98();
        func_8002FF70(arg0);
        func_8000D874(D_80087A64, D_80087990);
        func_8000D834(D_8008931C, D_80087990);
        func_8001AEA8(D_800892C4);
        func_800AF858();
        func_8002FEA4(&D_800934B0, 0xA, 0);
    }
}
