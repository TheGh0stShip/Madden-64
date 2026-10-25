#include "types.h"

extern void* D_800748E8;
extern void* D_8007A9A8;
extern void* D_8007A9AC;

extern void* func_80033174(s32 type, u16 count, s32 size);
extern void* func_80035D7C(u16 owner, s32 index);

void func_800420B0(u16 owner, u16 allocate) {
    if (allocate != 0) {
        D_800748E8 = func_80033174(0, allocate, 0x800);
    }
    D_8007A9A8 = func_80035D7C(owner, 0x40);
    D_8007A9AC = func_80035D7C(owner, 0x3F);
}
