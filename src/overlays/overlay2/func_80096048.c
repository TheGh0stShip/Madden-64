#include "types.h"

extern u8 D_800C39E0;
extern s16 D_800C502C;
extern s8 D_800C509C;

u8 func_800951B0(s32, u8);

u8 func_80096048(s32 team) {
    s32 run;
    s32 state;
    s32 i;

    run = 0;
    state = 0;
    if (D_800C509C < 5) {
        return 0;
    }
    for (i = 0; i < D_800C509C; i++) {
        if (state == 0) {
            if (func_800951B0(team, i) == 1) {
                run++;
                if (run == 2) {
                    state = 1;
                    run = 0;
                }
            } else {
                run = 0;
            }
        } else if (D_800C502C - 4 < i) {
            if (func_800951B0(team, i) == 0) {
                run++;
                if (run == 2) {
                    state++;
                    break;
                }
            } else {
                run = 0;
            }
        }
    }
    if (state != 2) {
        return 0;
    }
    return D_800C39E0;
}
