#include "types.h"

s32 func_800167FC();
s32 func_8002E65C();

extern char D_8006BE90[];
extern char D_8006BEA4[];
extern char D_8006BEB8[];
extern char D_8006BEC8[];
extern char D_8006BEDC[];
extern char D_8006BF40[];
extern char D_800BF2CC[];
extern u16 D_800C502C;

void func_800AA6EC(void) {
    s16 week;

    week = D_800C502C - 0x11;
    switch (week) {
    case 0:
        func_8002E65C(D_800BF2CC, D_8006BE90);
        return;
    case 1:
        func_8002E65C(D_800BF2CC, D_8006BEA4);
        return;
    case 2:
        func_8002E65C(D_800BF2CC, D_8006BEB8);
        return;
    case 3:
        func_8002E65C(D_800BF2CC, D_8006BEC8);
        return;
    case 4:
        func_8002E65C(D_800BF2CC, D_8006BEDC);
        return;
    default:
        func_8002E65C(D_800BF2CC, D_8006BF40);
        func_800167FC((s16)(D_800C502C + 1), D_800BF2CC + 5);
        return;
    }
}
