#include "types.h"

extern u16 D_80064A4E;
extern u16 D_80064A50;

u16 func_80031A1C(u16 range);

s32 func_800BD774(void) {
    s32 spread;
    s32 roll;
    s32 moved;

    moved = 0;
    if (D_80064A50 != 0) {
    spread = (u16)(D_80064A50 / 3);
    if (spread < 0x4C) {
        spread = 0x4C;
    }
    roll = func_80031A1C(spread / 8);
    D_80064A4E -= roll - spread / 16;
    if (D_80064A4E < 10) {
        D_80064A4E = 10;
    }
    if (D_80064A50 + spread < D_80064A4E) {
        D_80064A4E = D_80064A50 + spread - func_80031A1C(20);
    }
    if (D_80064A4E < D_80064A50 - spread) {
        D_80064A4E = func_80031A1C(20) + (D_80064A50 - spread);
    }
    moved = 1;
    }
    return moved;
}
