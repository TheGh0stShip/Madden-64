#include "types.h"

extern u16 D_8007A548;
extern s32 D_800740D0;
extern void func_80035A7C(u16 value);

void func_80041554(void) {
    func_80035A7C(D_8007A548);
    D_800740D0 = 0;
}
