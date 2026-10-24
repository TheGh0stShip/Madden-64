#include "types.h"

s32 func_8002E628(const u8 *left, const u8 *right) {
    s32 difference;

    while ((difference = *left - *right) == 0) {
        if (*left == 0) {
            break;
        }
        left++;
        right++;
    }

    return difference;
}
