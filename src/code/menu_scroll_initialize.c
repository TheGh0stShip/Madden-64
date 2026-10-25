#include "types.h"

extern s32 D_8008A748;
extern s32 D_80084F34;
extern s16 D_80087AF0;
extern s32 D_8008793C;
extern u16 D_8008777C;
extern u16 D_80089320;

void menu_scroll_initialize(void)
{
    s32 value = D_8008A748;
    s32 *bounded = &D_80084F34;
    u16 *flags;
    u16 flag_value;

    *bounded = value;
    if (value < (s32)0xFCE00000) {
        *bounded = 0xFCE00000;
        if (D_80087AF0 > 0) {
            *bounded = 0xFE200000;
        }
    } else if (value > 0x03200000) {
        *bounded = 0x03200000;
    }
    D_8008793C = D_8008A748 + 0x00A00000;
    if (D_8008793C > 0x03200000) {
        D_8008793C = 0x03200000;
    }
    flags = &D_8008777C;
    flag_value = *flags;
    D_80089320 = 1;
    *flags = flag_value | 8;
}
