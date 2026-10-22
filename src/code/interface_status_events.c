#include "types.h"

extern s16 D_800740E2;
extern s16 D_80087A68;
extern void func_8003CF78(s16, s16);

void func_800417C0(void) {
    func_8003CF78(6, D_800740E2);
    if (D_80087A68 == 1) {
        func_8003CF78(30, 8);
    }
}
