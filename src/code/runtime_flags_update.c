#include "types.h"

/*
 * runtime_flags_update: controller auto-repeat filter.
 *
 * Takes this frame's held buttons for `port`, keeps only those newly pressed or still held
 * past the mask in D_80089358, and gives each of three direction pairs a per-port repeat
 * timer: the first frame of a press passes, then the button is suppressed until the timer
 * reaches the repeat delay (D_800880A8), stepping by D_800876FC per frame.  Pressing one
 * direction of a pair resets the other's timer and cancels it.  The catalogue name is kept.
 */

#define REPEAT_IDLE -0x1516

extern s32 D_80087F90[];
extern s32 D_80089358;
extern s16 D_800880A8;
extern s32 D_800876FC;
extern s16 D_8008B388[];
extern s16 D_8008B648[];
extern s16 D_8008B2A0[];
extern s16 D_8008B630[];
extern s16 D_8008B380[];
extern s16 D_8008B640[];

static inline s32 button_repeat(s32 held, s32 bit, s16 *timer) {
    s16 time = *timer;
    s16 delay = D_800880A8;

    if (time >= delay) {
        *timer = time - delay;
        if (*timer >= delay) {
            *timer = 0;
        }
        return held;
    }
    if (time == REPEAT_IDLE) {
        *timer = 0;
        return held;
    }
    *timer = time + D_800876FC;
    return held & ~bit;
}

s32 runtime_flags_update(s32 buttons, s8 port) {
    s32 held;

    held = ~(D_80089358 & D_80087F90[port]) & buttons;
    D_80087F90[port] = buttons;
    if (held & 0x200) {
        D_8008B648[port] = REPEAT_IDLE;
        held = button_repeat(held, 0x200, &D_8008B388[port]);
        held &= ~0x100;
    } else {
        D_8008B388[port] = REPEAT_IDLE;
    }
    if (held & 0x100) {
        D_8008B388[port] = REPEAT_IDLE;
        held = button_repeat(held, 0x100, &D_8008B648[port]);
    } else {
        D_8008B648[port] = REPEAT_IDLE;
    }
    if (held & 0x800) {
        D_8008B2A0[port] = REPEAT_IDLE;
        held = button_repeat(held, 0x800, &D_8008B630[port]);
        held &= ~0x400;
    } else {
        D_8008B630[port] = REPEAT_IDLE;
    }
    if (held & 0x400) {
        D_8008B630[port] = REPEAT_IDLE;
        held = button_repeat(held, 0x400, &D_8008B2A0[port]);
    } else {
        D_8008B2A0[port] = REPEAT_IDLE;
    }
    if (held & 0x2020) {
        D_8008B640[port] = REPEAT_IDLE;
        held = button_repeat(held, 0x2020, &D_8008B380[port]);
        held &= ~0x10;
    } else {
        D_8008B380[port] = REPEAT_IDLE;
    }
    if (held & 0x10) {
        D_8008B380[port] = REPEAT_IDLE;
        held = button_repeat(held, 0x10, &D_8008B640[port]);
    } else {
        D_8008B640[port] = REPEAT_IDLE;
    }
    return held;
}
