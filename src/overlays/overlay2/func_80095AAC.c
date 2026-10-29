#include "types.h"

typedef struct {
    s8 cur;
} MenuState;

extern MenuState D_800C509C;
extern u8 D_800C39A8;
u8 func_800951B0(s32, u8);

u8 func_80095AAC(s32 team) {
    MenuState *st = &D_800C509C;

    if (st->cur >= 3) {
        if (func_800951B0(team, st->cur - 1) == 0 && func_800951B0(team, st->cur - 2) == 0) {
            return D_800C39A8;
        }
        return 0;
    }
    return 0;
}
