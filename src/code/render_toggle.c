#include "types.h"

extern s16 D_80065458;

void func_8000F8B8(void) {
}

void func_8000F8C0(s16 enabled) {
    if (enabled != 0) {
        D_80065458 = 1;
    } else {
        D_80065458 = 0;
    }
}
