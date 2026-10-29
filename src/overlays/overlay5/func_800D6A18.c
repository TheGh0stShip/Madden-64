#include "types.h"

extern s16 D_80088DB8[4];

s32 func_800D6A18(s16 index, s16 next) {
    s16 value;

    value = index;
    if (next) {
        value++;
        if (value >= 6) {
            value = 0;
        }
    }
    while (value == D_80088DB8[0] || value == D_80088DB8[1] ||
           value == D_80088DB8[2] || value == D_80088DB8[3]) {
        value++;
        if (value >= 6) {
            value = 0;
        }
    }
    return value;
}
