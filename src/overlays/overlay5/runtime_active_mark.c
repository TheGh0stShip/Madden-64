#include "types.h"

extern u8* D_80072468;

void func_800E0D10(void) {
    if (*(s32*)D_80072468 != 0) {
        D_80072468[8] = 1;
    }
}
