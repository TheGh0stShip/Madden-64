#include "types.h"

extern void* memcpy(void* destination, const void* source, u32 size);

void func_800632C8(void* source, void* destination, u32 count) {
    memcpy(destination, source, count << 7);
}
