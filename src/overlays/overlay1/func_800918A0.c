#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8000BF08();                            /* extern */
s32 func_8000DC7C(s32);                         /* extern */
s32 func_8003456C(s32, u16);                    /* extern */
s32 func_800915CC(s32, s32);                /* extern */
extern s32 D_80085298;
extern s32 D_80087A64;
extern s32 D_80088090;
extern volatile u16 D_8008A5B4;

void func_800918A0(void) {
    func_8000DC7C(D_80087A64);
    func_8003456C(D_80085298, D_8008A5B4);
    func_8003456C(D_80087A64, D_8008A5B4);
    func_8000BF08();
    func_800915CC(D_80088090, 0);
}
