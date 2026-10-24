#include "types.h"

extern s8 D_80087B08[];

s32 func_8003D8C0(s32 value) {
    s32 index = 7;
    s32 result;

    do {
        if (D_80087B08[index] == value) {
            result = 1;
            goto done;
        }
    } while (index-- != 0);
    result = 0;
done:
    return result;
}
