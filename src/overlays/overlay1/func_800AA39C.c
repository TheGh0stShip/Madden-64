#include "types.h"

s32 func_800AA39C(s16 *angle, s16 *speed, s32 target, s32 limitShift, s32 accelShift) {
    s32 diff;
    s32 after;

    target &= 0xFFF;
    diff = target - *angle;
    if (diff >= 0x800) {
        diff -= 0x1000;
    } else if (diff < -0x7FF) {
        diff += 0x1000;
    }
    if (diff < 0) {
        s32 neg = -diff;
        s32 accel = neg >> accelShift;
        s32 limit = neg >> limitShift;
        *speed -= 1; *speed -= accel;
        if (-*speed >= limit) {
            *speed = ~limit;
        }
    } else {
        s32 accel = diff >> accelShift;
        s32 limit = diff >> limitShift;
        *speed += 1; *speed += accel;
        if (*speed >= limit) {
            *speed = limit + 1;
        }
    }
    *angle = (*angle + *speed) & 0xFFF;
    after = target - *angle;
    if (after >= 0x800) {
        after -= 0x1000;
    } else if (after < -0x7FF) {
        after += 0x1000;
    }
    if ((diff ^ after) <= 0) {
        *angle = target;
        *speed = 0;
        return 1;
    }
    return 0;
}
