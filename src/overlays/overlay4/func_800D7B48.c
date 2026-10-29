#include "types.h"

typedef struct Big { s16 x0; u8 pad[0x214C - 2]; } Big;

void func_800D6228(s32);
extern s16 D_800886E0;
extern Big D_80082DC0[];

void func_800D7B48(void) {
    s16 v = D_80082DC0[D_800886E0].x0;

    if (v != 0x10) {
        if (v == 3) {
            func_800D6228(2);
            func_800D6228(3);
            goto common;
        }
    } else {
common:
        func_800D6228(6);
        func_800D6228(5);
    }
}
