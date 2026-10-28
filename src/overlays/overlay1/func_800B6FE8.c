#include "types.h"

extern s32 D_80088620;

s16 func_800B28B4(void);

s32 func_800B6FE8(void) {
    s32 result;

    if (func_800B28B4() != 0) {
        result = D_80088620;
    } else {
        result = -1;
    }
    return result;
}
