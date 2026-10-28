#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8002E9E8(s32);                     /* extern */
s32 func_80036540(s32);                         /* extern */
extern u16 D_80087914;
extern u16 D_8008A71C;

void func_800B2E98(void) {
    s32 var_a0;

    if ((D_80087914 == 1) && (func_80036540(1) == 0)) {
        D_80087914 = 0;
        D_8008A71C &= 0xFFFD;
    }
    if (D_8008A71C & 2) {
        func_8002E9E8(0x40004);
    } else {
        func_8002E9E8(4);
    }
}
