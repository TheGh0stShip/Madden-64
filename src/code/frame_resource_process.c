#include "types.h"

extern s32 fixed_ratio_scale(s32, s32);

s32 frame_resource_process(s32 arg0, s32 arg1, s32 arg2, s32 arg3, s32 arg4) {
    s32 total;
    s32 v;
    s32 d;

    d = arg0 << 16;
    if (d == 0) {
        return 0;
    }
    v = fixed_ratio_scale(fixed_ratio_scale(arg1 << 16, d) - 0x4CCC, 0x3333);
    if (v < 0) {
        v = 0;
    }
    if (v > 0x26000) {
        v = 0x26000;
    }
    total = v;
    v = fixed_ratio_scale(arg2 << 16, d);
    v -= 3;
    v /= 4;
    if (v < 0) {
        v = 0;
    }
    if (v > 0x26000) {
        v = 0x26000;
    }
    total += v;
    v = fixed_ratio_scale(fixed_ratio_scale(arg3 << 16, d), 0xCCC);
    if (v < 0) {
        v = 0;
    }
    if (v > 0x26000) {
        v = 0x26000;
    }
    total += v;
    v = fixed_ratio_scale(0x1851 - fixed_ratio_scale(arg4 << 16, d), 0xA3D);
    if (v < 0) {
        v = 0;
    }
    if (v > 0x26000) {
        v = 0x26000;
    }
    total += v;
    total *= 100;
    total /= 6;
    v = total & 0xFFFF;
    total &= 0xFFFF0000;
    v *= 10;
    return total + (v >> 16);
}
