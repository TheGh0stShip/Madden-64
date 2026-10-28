#include "types.h"

extern u8 D_800816A7[];

void func_8002212C(u16 row, u8 value, u16 entry, u16 byte_index) {
    s32 row_offset;
    s32 entry_offset;
    u8* base;
    u8* entry_base;
    s32 normalized_entry;
    u8* row_base;

    do {
        row_offset = row * 0x214C;
    } while (0);
    normalized_entry = entry;
    do {
        base = D_800816A7;
    } while (0);
    entry_offset = normalized_entry * 11;
    row_base = base + row_offset;
    entry_offset += (s32)row_base;
    entry_base = (u8*)entry_offset;
    entry_base[byte_index] = value;
}
