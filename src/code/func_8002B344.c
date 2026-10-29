#include "types.h"

s16 func_80023F94(u16 owner, u16 code);
u8 *func_8003AA28(u16 index);
extern u16 D_8006BAE4[3][5];

void func_8002B344(s32 arg0, s16 *arg1) {
    s32 v;
    s32 row;
    s32 i;
    u16 code;
    s16 t;

    v = func_8003AA28(arg0)[0xE] & 0x3F;
    if (v == 0) {
        row = 0;
    } else if (v < 0xA) {
        row = 1;
    } else {
        row = 2;
    }
    for (i = 0; i < 5; i++) {
        code = D_8006BAE4[row][i];
        if (code != 0x7FFF) {
            if (code != 0xF) {
                arg1[i] = func_80023F94(arg0, code);
            } else {
                t = func_80023F94(arg0, 0xF);
                arg1[i] = t + func_80023F94(arg0, 0xB);
            }
        }
    }
}
