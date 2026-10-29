#include "types.h"

extern s32 D_800892D8[];
void func_80016FF4(s32);

void func_80094504(void) {
    s8 i;

    for (i = 0; i < 4; i++) {
        func_80016FF4(D_800892D8[i]);
    }
}
