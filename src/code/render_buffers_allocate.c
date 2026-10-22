#include "types.h"

extern void* D_8007AB10;
extern void* D_8007AB14;
extern void* D_8007AB1C;
extern void* D_8007AB20;
extern u8 D_8007AB00;
extern u8 D_8007AB28;
extern void* func_80032E00(s32, u32);

void func_80045714(void) {
    D_8007AB10 = func_80032E00(0, 0xC600);
    D_8007AB14 = func_80032E00(0, 0xC600);
    D_8007AB1C = func_80032E00(0, 8);
    D_8007AB20 = func_80032E00(0, 8);
    D_8007AB00 = 2;
    D_8007AB28 = 32;
}
