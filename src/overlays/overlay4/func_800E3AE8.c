#include "types.h"

extern s16 D_80089342;
extern u8 D_8008AFD8[];
extern s16 func_80031A1C(u16 range);

s16 func_800E3AE8(void) {
    s16 i;
    u16 total;
    s16 roll;

    total = 0;
    for (i = 0; i < D_80089342; i++) {
        total += D_8008AFD8[i];
    }
    if (total == 0) {
        return 0;
    }
    roll = func_80031A1C(total);
    while (roll >= 0) {
        i--;
        roll -= D_8008AFD8[i];
    }
    return i;
}
