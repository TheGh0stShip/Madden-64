#include "types.h"

extern s8 D_800C509C;
extern s16 D_800C502C;
extern u8 D_800C39D8;

u8 func_800951B0(s32 team, u8 week);

/* After week 5: two straight results of 0 early, then two straight 1s within the last four weeks. */
u8 func_80095F24(s32 team) {
    s32 run = 0;
    s32 phase = 0;
    s32 week;

    if (D_800C509C < 5) {
        return 0;
    }
    for (week = 0; week < D_800C509C; week++) {
        if (phase == 0) {
            if (func_800951B0(team, week) != 0) {
                run = 0;
            } else if (++run == 2) {
                phase = 1;
                run = 0;
            }
        } else if (D_800C502C - 4 < week) {
            if (func_800951B0(team, week) != 1) {
                run = 0;
            } else if (++run == 2) {
                phase++;
                break;
            }
        }
    }
    if (phase != 2) {
        return 0;
    }
    return D_800C39D8;
}
