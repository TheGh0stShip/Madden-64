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

void func_800A0364(void)
{
    u16 counter_step;
    u32 flags;
    s32 initial_value;
    s32 first_value;
    u32 mask;

    do {
        counter_step = D_80087A60;
    } while (0);
    do {
        flags = D_80080C10;
    } while (0);
    do {
        initial_value = 50;
        first_value = 25;
    } while (0);
    do {
        D_80087758 = first_value;
    } while (0);
    do {
        mask = ~0x600;
    } while (0);
    do {
        D_80085288 = initial_value;
        D_800892A8 = initial_value;
        D_80087B5E = initial_value;
        D_800857F0 = 0;
        D_80085BFA = 0;
        D_80084F70 = 0;
    } while (0);
    flags &= mask;
    D_80087AAC = counter_step;
    D_80080C10 = flags;
}
