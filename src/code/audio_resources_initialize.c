#include "types.h"

extern u16 D_80086CA2;
extern s16 D_8008AF9C;
extern void* D_80073430;
extern void* D_80073434;
extern void* D_80073438;
extern u8 D_80000430[];

extern u16 func_800356C4(void* source, s32 size);
extern void* func_80035EF0(u16 owner, s32 index);

void func_80039674(void) {
    D_80086CA2 = func_800356C4(D_80000430, 0x18);
    D_80073434 = func_80035EF0(D_80086CA2, 0);
    D_80073430 = func_80035EF0(D_80086CA2, 1);
    D_8008AF9C = 0;
    D_80073438 = 0;
}
