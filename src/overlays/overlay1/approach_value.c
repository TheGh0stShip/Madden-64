#include "types.h"

s32 func_800AC9D4(s32 current, s32 target) {
    s32 step = target - current;

    if (step > 0) {
        step >>= 3;
        if (step == 0) {
            step = 1;
        }
    }
    if (step < 0) {
        step /= 8;
        if (step == 0) {
            step = -1;
        }
    }
    return current + step;
}
