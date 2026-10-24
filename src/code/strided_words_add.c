#include "types.h"

void func_80036570(s32 offset, s32 value, s32 stride, u16 count, s32 unused,
                   u8* base) {
    register u16 i __asm__("$3");
    register u8* input_base __asm__("$2") = base;
    register u8* current __asm__("$4");

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
