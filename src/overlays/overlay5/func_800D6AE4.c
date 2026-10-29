#include "types.h"

extern s16 D_80088DB8[4];

s32 func_800D6AE4(s16 index, s16 previous) {
    s16 value;

    value = index;
    if (previous) {
        value--;
        if (value < 0) {
            value = 5;
        }
    }
    while (value == D_80088DB8[0] || value == D_80088DB8[1] ||
           value == D_80088DB8[2] || value == D_80088DB8[3]) {
        value--;
        if (value < 0) {
            value = 5;
        }
    }
    return value;
}
