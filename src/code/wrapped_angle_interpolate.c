#include "types.h"

u32 func_80042EC0(s32 start, s32 end, s32 amount) {
    register s32 work __asm__("$3") = (s16)end;
    register s32 start_value __asm__("$2") = (s16)start;
    register s32 difference __asm__("$7") = work - start_value;
    register s32 step __asm__("$8");
    register s32 factor __asm__("$2");

    work = difference;
    if (difference < 0) {
        work = -work;
    }

    step = amount;
    if ((u32)work >= 0x80) {
        if (difference > 0) {
            step = -amount;
        }
        factor = 0x100;
        difference = factor - work;
        factor = (u8)step;
        difference *= factor;
        factor = (u16)start;
        work = (u16)end;
        difference >>= 4;
        if ((u32)factor < (u32)work) {
            start = end;
        }
        factor = (u16)start;
        factor <<= 4;
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
