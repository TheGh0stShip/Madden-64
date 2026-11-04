#include "types.h"

extern u8 *func_8001B02C(s32);
extern u8 *D_8008AFCC;
extern u8 *D_80084F74;
extern u8 *D_80088DC0;
extern u8 *D_80080C80;
extern u8 *D_80087A98;
extern s16 D_80086BEA;
extern s16 D_80086C38;
extern s16 D_80080C0A;
extern s16 D_8008501C;

void func_800C268C(void) {
    u8 *base;
    u8 *first;
    u8 *second;
    u8 b13;
    u8 b14;
    u8 b9;
    u8 b10;

    base = func_8001B02C(0x110);
    D_8008AFCC = base;
    D_80084F74 = base + 4;
    D_80088DC0 = base + 0x13;
    if ((u32)((base[4] & 0x1F) - 2) < 2 ||
        (u32)((base[4] & 0x1F) - 7) < 2) {
        D_80088DC0 = base + 4;
        D_80084F74 = base + 0x13;
    }

    first = D_80084F74;
    second = D_80088DC0;
    D_80084F74 = first + 9;
    D_80080C80 = first + 13;
    b13 = first[13];
    b14 = first[14];
    b9 = first[9];
    b10 = first[10];
    D_80087A98 = second;
    D_80086BEA = ((s8)b13 + ((s8)b14 << 8)) -
                  ((s8)b9 + ((s8)b10 << 8));

    if (!(second[0] & 0x40)) {
        D_80088DC0 = second + 3;
    }
    if (!(second[0] & 0x20)) {
        D_80088DC0 += 3;
    }

    second = D_80088DC0;
    D_80088DC0 = second + 1;
    D_80087A98 = second + 5;
    D_80086C38 = ((s8)second[5] + ((s8)second[6] << 8)) -
                  ((s8)second[1] + ((s8)second[2] << 8));
    D_80080C0A = second[1] + ((s8)second[2] << 8);
    D_8008501C = first[13] + ((s8)first[14] << 8);
}
