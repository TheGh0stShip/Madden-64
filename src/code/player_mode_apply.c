#include "types.h"

extern s8 D_8006A9B8[];
extern u8 D_80074808;
extern void func_80021EE0(u16 player);

void player_mode_apply(s8 mode, s32 player)
{
    u8 saved;

    if (mode == D_8006A9B8[player]) {
        return;
    }
    D_8006A9B8[player] = mode;
    if (mode == 1) {
        func_80021EE0(player);
    } else {
        saved = D_80074808;
        D_80074808 = 0;
        func_80021EE0(player);
        D_80074808 = saved;
    }
}
