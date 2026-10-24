#include "types.h"

extern u16 D_80088AE4;
extern u32 D_80080C10;
extern s16 D_80064A4A;

s32 func_8003BF54(u16 mode) {
    u32 flag;

    if (mode == D_80088AE4) {
        flag = D_80080C10 & 2;
    } else {
        flag = D_80080C10 & 4;
    }
    if (flag == 0) {
        return 1;
    }
    return D_80064A4A;
}
