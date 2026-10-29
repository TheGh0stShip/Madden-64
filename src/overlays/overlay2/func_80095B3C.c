#include "types.h"

typedef struct {
    s8 cur;
} MenuState;

extern MenuState D_800C509C;
extern u8 D_800C39B0;
u8 func_800951B0(s32, u8);

u8 func_80095B3C(s32 team) {
    MenuState *st = &D_800C509C;
    u8 last;

    if (st->cur >= 3) {
        last = func_800951B0(team, st->cur - 1);
        if (last == 1 && func_800951B0(team, st->cur - 2) == last) {
            return D_800C39B0;
        }
        return 0;
    }
    return 0;
}
