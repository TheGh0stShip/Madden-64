#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8009C99C();                            /* extern */
s32 func_8009CA08();                                /* extern */
s32 func_800AE9A4();                                /* extern */
extern s32 D_80080C10;
extern s8 D_80084F70;
extern u16 D_80085288;
extern s16 D_8008616A;
extern s16 D_80087758;
extern u16 D_80087B5E;

void func_800A1024(s16 arg0, s8 arg1) {
    D_80084F70 = arg1;
    D_8008616A = arg0;
    if (!(D_80080C10 & 0x400)) {
        D_80087758 = arg0;
    }
    D_80087B5E = D_80085288;
    if (((arg1 == 1) || ((arg1 == 2) && (func_8009CA08() != 0))) && ((func_800AE9A4() << 0x10) == 0)) {
        func_8009C99C();
    }
}
