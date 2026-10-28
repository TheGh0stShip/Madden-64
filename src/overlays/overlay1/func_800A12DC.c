#include "types.h"

extern u16 D_8006B7A8;
extern s32 D_80080C10;
extern s16 D_800857F0;
extern s16 D_80086CF2;
extern s16 D_800892C8;
extern s16 D_800894FC;
extern u16 D_8008A5B2;

void func_800A365C(s32);
void func_800AD404(void);
void func_800AD49C(void);
void func_800AD4F8(void);
s16 func_800AEAAC(void);
void func_800BE784(void);

void func_800A12DC(s16 arg0, s16 arg1) {
    s32 flag = D_80080C10 & 0x2000;
    u16 *mode;

    D_80080C10 &= ~0x800;
    if (flag != 0) {
        func_800BE784();
    }
    if (D_80086CF2 == 6) {
        func_800A365C(0);
    }
    D_800857F0 = arg0;
    D_800894FC = arg1;
    if (D_8008A5B2 != 1) {
        D_8008A5B2 = 0;
    }
    D_800892C8 = 0;
    mode = &D_8006B7A8;
    if ((*mode == 2 || *mode == 3) || *mode == 1) {
        *mode = 4;
        D_800857F0 = arg0 + 0x32;
        D_800892C8 = 0;
    }
    if (func_800AEAAC() == 0) {
        func_800AD4F8();
        func_800AD404();
        func_800AD49C();
    }
}
