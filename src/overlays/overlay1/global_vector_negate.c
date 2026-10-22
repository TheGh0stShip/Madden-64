#include "types.h"

extern s32 D_8007A090;
extern s32 D_8007A094;
extern s32 D_8007A0A0;
extern s32 D_8007A0A4;

void func_800AA124(void) {
    register s32* x0_address asm("$6") = &D_8007A090;
    register s32* x1_address asm("$7");
    register s32 x0 asm("$2") = *x0_address;
    register s32 y0 asm("$3") = D_8007A094;
    register s32 x1 asm("$4");
    register s32 y1 asm("$5");

    __asm__ volatile("" ::: "memory");
    x1_address = &D_8007A0A0;
    x1 = *x1_address;
    y1 = D_8007A0A4;

    *x0_address = -x0;
    D_8007A094 = -y0;
    *x1_address = -x1;
    D_8007A0A4 = -y1;
}
