#include "types.h"

extern s16 D_800E7A90;

void func_800D5290(s32, s32);

void func_800AE6E0(u16 arg0, s16 arg1) {
    if (arg1 == 1) {
        D_800E7A90 = arg0;
        func_800D5290((s16)arg0, 0);
    } else {
        D_800E7A90 = 0;
        func_800D5290(0, 0);
    }
}
