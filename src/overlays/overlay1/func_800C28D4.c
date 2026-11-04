#include "types.h"

extern u16 D_80064A4C;
extern u16 D_80064A4E;
extern s16 D_80072730[];
extern s32 D_80080C10;
extern s16 D_80080C20;
extern u16 D_80086D48;
extern s16 D_8008A3FC;
extern u16 D_8008A71C;
extern s16 D_8008B33C;
extern s32 D_800BE644;

s32 func_80016FD4(void);
void func_8002FEA4(s32 *, s32, s32);
void func_8003647C(u16, s16);

void func_800C28D4(void) {
    s32 mode;

    if (D_80080C10 & 0x2000) {
        return;
    }

    D_8008B33C = -1;
    D_8008A3FC = 0;
    if (D_80064A4E != 0) {
        for (D_8008B33C = D_80064A4C - D_80086D48 + 0xFF;
             D_8008B33C < 0; D_8008B33C += 0xFFF) {
        }

        D_8008B33C = ((u16)D_8008B33C >> 9) & 7;
        if (D_80064A4E < 0x180) {
            D_8008B33C += 8;
        }
        if (!(D_8008A71C & 2)) {
            D_80080C20 = 2;
            func_8003647C(func_80016FD4(), D_80072730[D_8008B33C]);
            D_8008A71C |= 2;
            goto done;
        }
        mode = 1;
        goto store_mode;
    }

    mode = 4;
store_mode:
    D_80080C20 = mode;
done:
    func_8002FEA4(&D_800BE644, 1, 1);
    D_80080C10 |= 0x2000;
}
