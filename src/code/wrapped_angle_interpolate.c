#include "types.h"

u32 func_80042EC0(s32 start, s32 end, s32 amount) {
    s32 difference;
    s32 work;
    s32 step;
    s32 factor;
    difference = (s16)end - (s16)start;
    work = difference ^ amount ^ amount;
    if (difference < 0) {
        work = -work;
    }
    step = amount ^ start ^ start;
    if ((u32)work >= 0x80) {
        if (difference > 0) {
            step = -amount;
        }
        difference = 0x100 - work;
        difference *= (u8)step;
        difference >>= 4;
        if ((u16)start < (u16)end) {
            start = end;
        }
        factor = (u16)start << 4;
    } else {
        factor = (u8)step;
        difference *= factor;
        factor = (u16)start;
        factor <<= 4;
        difference >>= 4;
    }
    difference += factor;
    return difference & 0xFFF;
}
