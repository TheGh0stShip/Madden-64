#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_80032E00(s32, s32);                /* extern */
extern s32 D_8006B9D4;
extern s16 D_80087914;
extern s16 D_80089510;

void func_800AE908(void) {
    D_8006B9D4 = func_80032E00(0, 0x2000);
    D_80089510 = 0;
    D_80087914 = 0;
}
