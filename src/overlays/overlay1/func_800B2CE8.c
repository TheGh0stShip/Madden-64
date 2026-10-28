#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_800363F4(u16, s32, s32);           /* extern */
extern s32 D_8006B9D4;
extern s16 D_80087914;
extern u16 D_80088472;
extern u16 D_80089510;
extern u16 D_8008A71C;

void func_800B2CE8(u16 arg0) {
    s32 temp_v1;

    temp_v1 = arg0 & 0xFFFF;
    if ((temp_v1 != 0) && (temp_v1 != D_80089510)) {
        if (!(D_8008A71C & 2)) {
            D_80089510 = arg0;
            func_800363F4(D_80088472, 0, D_8006B9D4);
            D_80087914 = 1;
            D_8008A71C |= 2;
            return;
        }
        D_80089510 = 0;
    }
}
