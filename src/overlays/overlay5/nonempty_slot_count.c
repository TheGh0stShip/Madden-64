#include "types.h"

extern s16 D_800881A0[8];

s32 func_800D2FF8(void) {
    s32 index;
    s32 count = 0;

    for (index = 0; index < 8; index++) {
        count += D_800881A0[index] != -1;
    }
    return count;
}
