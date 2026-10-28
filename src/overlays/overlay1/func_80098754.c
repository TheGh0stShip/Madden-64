#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_80016FE4(s32);                         /* extern */
s32 func_80016FF4(s32);                         /* extern */
s32 func_80097120(s32);                         /* extern */
extern u16 D_8006B7A8;
extern u32 D_80085128;
extern s16 D_80087948;
extern u16 D_800879A0;
extern s32 D_80087AC8;
extern u16 D_80088D28;
extern u16 D_800895C4[];
extern s16 D_8008A5B0;
extern u16 D_8008A5B4;
extern u32 D_8008A6C4;
extern s32 D_8008AF90;

void func_80098754(void) {
    s32 temp_v0_2;
    u16 temp_v0;
    u16 temp_v1;
    u32 temp_a0;

    if (D_8008A5B0 == 4) {
        temp_v0 = D_800879A0 + D_8008A5B4;
        D_800879A0 = temp_v0;
        if ((s16) temp_v0 >= 0x64) {
            if (D_80087948 != 0) {
                func_80016FF4(D_80087AC8);
                D_80087948 = 0;
            } else {
                func_80016FE4(D_80087AC8);
                D_80087948 = 1;
            }
            D_800879A0 = 0;
        }
    }
    if (D_80088D28 == 1) {
        temp_a0 = D_80085128 + 0x13C6;
        if (((u32) D_8008A6C4 >= temp_a0) && (D_8006B7A8 == 0)) {
            D_80085128 = temp_a0;
            temp_v1 = D_800895C4[0] + 1;
            D_800895C4[0] = temp_v1;
            if ((temp_v1 & 0xFF) == 0x80) {
                temp_v0_2 = D_8008AF90 + 1;
                D_8008AF90 = temp_v0_2;
                func_80097120(temp_v0_2 & 0xFF);
            }
        }
    }
}
