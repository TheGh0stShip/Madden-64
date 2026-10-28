#include "types.h"

#ifndef NULL
#define NULL 0
#endif

void *func_80037108(s32 *, s32);            /* extern */
s32 func_8009C448();                            /* extern */
s32 func_800ABCA0(s32, s32);                /* extern */
s32 func_800AD404();                            /* extern */
s32 func_800AD460();                            /* extern */
s32 func_800AD49C();                            /* extern */
s32 func_800AD4F8();                            /* extern */
s32 func_800AEA9C(s32);                     /* extern */
s32 func_800B7DD8(s32, s32, s16, s32, s32); /* extern */
extern s32 D_80000F10;
extern u16 D_80082D94;
extern u16 D_80084EE0;
extern s16 D_800876DC;
extern s16 D_8008A5B0;

void func_800B3558(void *arg0) {
    s32 var_s0;

    func_800AD404();
    func_800AD4F8();
    func_800AD460();
    func_800AD49C();
    if (D_800876DC != 6) {
        var_s0 = (*(s32 *)((u8 *)(arg0) + 4)) + 2;
        func_800B7DD8(2, 0x13, D_800876DC, 0, 0);
    } else {
        var_s0 = 8;
    }
    if ((u32) ((u16) D_800876DC - 4) < 2U) {
        if (D_80082D94 != D_80084EE0) {
            var_s0 = 8;
        }
        if (((s16) (u16) D_800876DC == 5) && (D_8008A5B0 == 1) && ((*(s8 *)((u8 *)(func_80037108(&D_80000F10, 1)) + 4)) < 0x11)) {
            var_s0 = 8;
        }
    }
    func_8009C448();
    func_800ABCA0(var_s0 & 0xFFFF, 0);
    func_800AEA9C(1);
}
