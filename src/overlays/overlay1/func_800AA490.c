#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_800AA490(s32 *arg0, s32 *arg1, s32 arg2, s32 arg3, s32 arg4) {
    s32 temp_a0;
    s32 temp_a3;
    s32 temp_a3_2;
    s32 temp_t0;
    s32 temp_v0;

    temp_t0 = arg2 - *arg0;
    temp_a0 = *arg1 + (temp_t0 >> arg4);
    *arg1 = temp_a0;
    if (temp_t0 < 0) {
        temp_a3 = (s32) -temp_t0 >> arg3;
        if (-temp_a0 >= temp_a3) {
            *arg1 = ~temp_a3;
        }
    } else {
        temp_a3_2 = temp_t0 >> arg3;
        if (temp_a0 >= temp_a3_2) {
            *arg1 = temp_a3_2 + 1;
        }
    }
    temp_v0 = *arg0 + *arg1;
    *arg0 = temp_v0;
    if ((temp_t0 ^ (arg2 - temp_v0)) > 0) {
        return 0;
    }
    *arg0 = arg2;
    *arg1 = 0;
    return 1;
}
