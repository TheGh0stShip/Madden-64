#include "types.h"

extern void* func_80033174(s32 arena, u16 count, s32 size);
extern void* D_8008A700;

void func_80016EB4(u16 count) {
    D_8008A700 = func_80033174(0, count, 0x200);
}
