#include "types.h"

extern void func_80061A10(u8* object, u32 value);

void func_800625E0(u8* object) {
    u8* runtime = *(u8**)(object + 0x1C8);

    *(u32*)(object + 0x88) = *(u32*)(runtime + 0x10);
    func_80061A10(object, *(u32*)(runtime + 0x14));
    *(u32*)(runtime + 0x1C) = 1;
}
