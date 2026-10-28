#include "types.h"

void func_80036570(s32 offset, s32 value, s32 stride, u16 count, s32 unused,
                   u8* base) {
    u16 i;
    u8* input_base = base;
    u8* current;

    i = 0;
    if (count != 0) {
        current = input_base + offset;
        do {
            *(u32*)current += value;
            i++;
            current += stride;
        } while (i < count);
    }
}
