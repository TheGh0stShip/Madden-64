#include "types.h"

extern u8* D_80074D78;
extern void* func_80032E00(s32, u32);

void func_800457F8(u32 boundary) {
    u8* range = func_80032E00(0, 12);

    D_80074D78 = range;
    *(u32*)(range + 4) = boundary;
    *(u32*)(range + 8) = boundary;
    *(u32*)range = 0;
}
