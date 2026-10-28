#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_80039750(void *);                          /* extern */
s32 func_800A365C(s32);                     /* extern */
s32 func_800AD404();                            /* extern */
s32 func_800AD49C();                            /* extern */
s32 func_800AE5C4(s32);                         /* extern */
s32 func_800AEAAC();                                /* extern */
s32 func_800BE784();                            /* extern */
extern s32 D_80080C10;
extern void *D_80085284;
extern s16 D_800857F0;
extern s16 D_80086CF2;
extern u8 D_80086DCC;
extern s16 D_800876DC;
extern s16 D_80087AAC;
extern s16 D_800894FC;
extern void *D_8008A058;
extern u16 D_8008A5B2;

void func_800A1180(s16 arg0, s16 arg1) {
    s32 temp_v1;
    void *var_a0;

    temp_v1 = D_80080C10 & 0x2000;
    D_80080C10 &= ~0x800;
    if (temp_v1 != 0) {
        func_800BE784();
    }
    if (D_80086CF2 == 6) {
        func_800A365C(0);
    }
    if (D_800894FC == 0) {
        D_800857F0 = arg0;
        D_800894FC = arg1;
        if (D_8008A5B2 != 1) {
            D_8008A5B2 = 0;
        }
        if ((D_800876DC != 4) || (D_80087AAC >= 0x29) || (D_80086DCC != 0)) {
            var_a0 = D_8008A058;
            if (var_a0 != NULL) {
                if ((*(s32 *)((u8 *)((*(void **)((u8 *)(var_a0) + 0x24))) + 0x20)) > 0x031FFFFF) {

                } else {
                    goto block_14;
                }
            } else {
                var_a0 = D_80085284;
                if (var_a0 != NULL) {
block_14:
                    func_800AE5C4(func_80039750(var_a0) & 0xFFFF);
                }
            }
        }
        if ((func_800AEAAC() << 0x10) == 0) {
            func_800AD404();
            func_800AD49C();
        }
    }
}
