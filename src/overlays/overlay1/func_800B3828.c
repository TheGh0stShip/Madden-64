#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8002E65C(s32 *, s32 *);        /* extern */
s16 func_800AACE8(s32, s32 *, s32);         /* extern */
s32 func_800AAFB0(s32 *, s16, s16);         /* extern */
s16 func_800B932C(s16, s32);                        /* extern */
extern s32 D_8006B98C[];
extern s32 *D_8006B990;
extern s16 D_8006B9BE;
extern s32 D_8006DF0C;
extern s16 D_80084F34;
extern s32 D_80086DB0;
extern s32 D_8008793C;
extern s16 D_80089320;

void func_800B3828(void) {
    s16 var_v0;

    if (D_80089320 != -1) {
        if (D_8008793C != 0x03200000) {
            var_v0 = func_800B932C(D_80084F34, (s32) D_8008793C >> 0x10);
        } else {
            var_v0 = -1;
        }
        func_800AAFB0(&D_80086DB0, D_80089320, var_v0);
        D_8006B98C[0] = 1;
        D_8006B990 = &D_80086DB0;
        if (D_80089320 == 0) {
            func_8002E65C(&D_80086DB0, &D_8006DF0C);
        }
        D_8006B9BE = func_800AACE8(0xF0, D_8006B98C, 4);
    }
}
