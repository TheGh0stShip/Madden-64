#include "types.h"

extern s32 D_8006B98C[];
extern s32 D_8006B990;
extern s16 D_8006B9C0;
extern s32 D_8006DAE4[];
extern s32 D_800AD588;

void func_8002FEA4(s32 *, s32, s32);
s16 func_800AACE8(s32, s32 *, s32);
void func_800AD460(void);

void func_800B03C4(u16 index, u16 count) {
    if (D_8006B9C0 != -1) {
        func_800AD460();
    }
    if (count != 0) {
        func_8002FEA4(&D_800AD588, 4, count);
    }
    D_8006B98C[0] = 1;
    D_8006B990 = D_8006DAE4[index];
    D_8006B9C0 = func_800AACE8(0x98, D_8006B98C, 3);
}
