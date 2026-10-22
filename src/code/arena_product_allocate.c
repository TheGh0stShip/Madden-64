#include "types.h"

extern void* func_800337CC(s32 arena, u32 size, u32 alignment);

void* func_8003332C(u16 width, u16 height) {
    return func_800337CC(0, width * height, 0x40);
}
