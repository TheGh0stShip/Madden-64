#include "types.h"

s32 func_8002E148(const u8 *left, const u8 *right, u32 count) {
    s32 difference = 0;

    while ((count != 0) &&
           ((difference = *left - *right) == 0)) {
        left++;
        right++;
        count--;
    }

    return difference;
}
