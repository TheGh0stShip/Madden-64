#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8008D1EC();                            /* extern */
s16 func_8009321C(s32);                         /* extern */
s32 func_8009360C();                            /* extern */
extern u16 D_800876DC;
extern s32 D_80089490;

void func_800989AC(void) {
    s16 temp_s0;

    if ((u32) (D_800876DC - 7) < 2U) {
        if ((s16) D_800876DC == 8) {
            temp_s0 = func_8009321C(0);
            if (((temp_s0 + func_8009321C(1)) > 0) && (D_80089490 != -1)) {
                func_8009360C();
                return;
            }
        }
        func_8008D1EC();
    }
}
