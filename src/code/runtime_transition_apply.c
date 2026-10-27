#include "types.h"

extern void object_lookup_initialize(u8* object, u32 value);

void func_800625E0(u8* object) {
    u8* runtime = *(u8**)(object + 0x1C8);

    *(u32*)(object + 0x88) = *(u32*)(runtime + 0x10);
    object_lookup_initialize(object, *(u32*)(runtime + 0x14));
    *(u32*)(runtime + 0x1C) = 1;
}
