#include "types.h"

extern u8 D_80080D6A[];

u8* func_800B1848(u8* object) {
    s32 record_index = object[0x1E];
    s32 entry_index = object[0x1F];
    register u8* base __asm__("$5") = D_80080D6A;
    s32 record_offset = record_index * 0x214C;
    register u8* lookup_base __asm__("$3") = base + 0xAF6;
    s16 offset = *(s16*)(lookup_base + record_offset + entry_index * 2);

    return base + record_offset + offset * 0x28;
}
