#include "types.h"

extern u32 D_80080C10;
extern u8 D_80084F70;
extern s16 D_80085288;
extern s16 D_800857F0;
extern u8 D_80085BFA;
extern s16 D_80087758;
extern u16 D_80087A60;
extern u16 D_80087AAC;
extern s16 D_80087B5E;
extern s16 D_800892A8;

void func_800A0364(void) {
    register u16 counter_step __asm__("$5") = D_80087A60;
    register u32 flags __asm__("$4") = D_80080C10;
    register s32 initial_value __asm__("$3") = 50;
    register s32 first_value __asm__("$2") = 25;

    D_80085288 = initial_value;
    D_800892A8 = initial_value;
    D_80087B5E = initial_value;
    D_80087758 = first_value;
    D_800857F0 = 0;
    D_80085BFA = 0;
    D_80084F70 = 0;
    D_80087AAC = counter_step;
    D_80080C10 = flags & ~0x600;
}
