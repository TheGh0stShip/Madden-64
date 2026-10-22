#include "types.h"

extern s16 D_800718E0;
extern s16 D_800718E2;
extern s16 D_800718E4;

void func_800B6918(void) {
    if (D_800718E4 == 1) {
        D_800718E0 = 1;
    }
    D_800718E4 = 0;
}

void func_800B6944(void) {
    D_800718E0 = 0;
}

s16 func_800B6954(void) {
    return D_800718E0;
}

s16 func_800B6964(void) {
    return D_800718E2;
}
