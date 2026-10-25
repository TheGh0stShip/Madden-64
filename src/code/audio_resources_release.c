#include "types.h"

extern u16 D_80086CA2;
extern void* D_80073430;
extern void* D_80073434;
extern void func_80035F88(u16 owner, s32 index);
extern void func_80035A7C(u16 owner);
extern void func_8003A600(s32 first, s16 second);

void func_800396E0(s16 value) {
    func_80035F88(D_80086CA2, 0);
    func_80035F88(D_80086CA2, 1);
    func_80035A7C(D_80086CA2);
    D_80073430 = 0;
    D_80073434 = 0;
    func_8003A600(0, value);
}
