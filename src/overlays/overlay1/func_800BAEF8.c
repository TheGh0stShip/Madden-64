#include "types.h"

extern s32 D_8007A24C;
extern u8 D_80084FA8;
extern s16 D_8008A63C;
extern s16 D_8008A63E;
extern s16 D_8008A644;
extern s16 D_8008A646;
extern s16 D_8008A648;
extern u16 D_8008A664;

void func_800BAEF8(u16 arg0) {
    u8 enabled = D_80084FA8;
    u16 *flags;

    D_8008A644 = 0x500;
    D_8008A63C = 0x400;
    D_8008A646 = 0;
    D_8008A63E = 0;
    flags = &D_8008A664;
    *flags |= 0x400;
    if (arg0 == 0) {
        enabled = enabled == 0;
    }
    if (enabled == 0) {
        D_8008A648 = 0;
    } else {
        D_8008A648 = 0x800;
    }
    D_8007A24C = 0x01400000;
}
