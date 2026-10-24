#include "types.h"

extern u8 D_800816A7[];

void func_8002212C(u16 row, u8 value, u16 entry, u16 byte_index) {
    register s32 row_offset __asm__("$2");
    register s32 entry_offset __asm__("$3");
    register u8* base __asm__("$4");
    register u8* entry_base __asm__("$3");
    register s32 normalized_entry __asm__("$6");
    u8* row_base;

    row_offset = row * 0x214C;
    __asm__ volatile ("" : : "r"(row_offset));
    normalized_entry = entry;
    __asm__ volatile ("" : : "r"(normalized_entry));
    base = D_800816A7;
    __asm__ volatile ("" : : "r"(base));
    entry_offset = normalized_entry * 11;
    __asm__ volatile ("" : : "r"(entry_offset));
    row_base = base + row_offset;
    __asm__ volatile ("" : : "r"(row_base));
    entry_offset += (s32)row_base;
    entry_base = (u8*)entry_offset;
    __asm__ volatile ("" : : "r"(entry_base));
    entry_base[byte_index] = value;
}
