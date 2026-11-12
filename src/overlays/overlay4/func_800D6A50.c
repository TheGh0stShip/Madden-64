#include "types.h"

extern s16 D_80084F34;
extern s16 D_80089480;
extern s16 D_80089482;
extern s16 D_80089484;
extern s16 D_80089486;
extern s16 D_80089488;
extern s16 D_8008948A;

void func_800D6A50(void) {
    s32 base = D_80084F34;
    s32 t;
    s32 out;
    s32 a;
    s32 c;

    do {
        t = base + 0x10;
    } while (0);
    a = base + 0xA0;
    do {
        c = base - 0x20;
    } while (0);
    D_80089484 = t;
    D_80089482 = t;
    D_80089480 = c;
    if (a > 0x370) {
        a = 0x370;
    }
    out = a;
    a = base + 0x140;
    D_80089488 = out;
    D_80089486 = out;
    if (a > 0x3C0) {
        a = 0x3C0;
    }
    D_8008948A = a;
}
