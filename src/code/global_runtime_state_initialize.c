#include "types.h"

extern u16 D_8008A5B4;
extern u32 D_8008B638;
extern u16 D_800892B4[];
extern u16 D_80085A40;
extern u16 D_80087A92;
extern u8 D_8008B2A8[];
extern u8 D_80089C18;
extern u16 D_80087A60;
extern void *D_80086DD8;
extern u8 D_800E49F0[];
extern u8 D_800908B8[];
extern void *D_80087894;
extern u8 D_800C2EC8[];
extern void *D_80085A30;
extern u8 D_800C4368[];
extern void *D_80088094;
extern u8 D_80072DF0[];
extern u16 D_8008A5B0;
extern void *D_8008B374;
extern u8 D_8006AAD8[];
extern u32 D_80087A64;
extern u32 D_80085298;

void global_runtime_state_initialize(void)
{
    s32 index;
    u8 *clear;

    D_8008A5B4 = 1;
    D_8008B638 = 1;
    D_800892B4[0] = 9;
    D_800892B4[1] = 10;
    D_80085A40 = 0;
    D_80087A92 = 0;
    index = 3;
    clear = &D_8008B2A8[3];
    do {
        *clear = 0;
        index--;
        clear--;
    } while (index >= 0);
    D_80087A60 = 300;
    if (D_80089C18 == 0) {
        D_80086DD8 = D_800E49F0;
    } else {
        D_80086DD8 = D_800908B8;
    }
    D_80087894 = D_800C2EC8;
    D_80085A30 = D_800C4368;
    D_80088094 = D_80072DF0;
    D_8008A5B0 = 0;
    D_8008B374 = D_8006AAD8;
    D_80087A64 = 0;
    D_80085298 = 0;
}
