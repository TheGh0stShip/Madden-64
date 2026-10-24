#include "types.h"

typedef struct RangeEntry {
    u8 pad00[8];
    u32 value;
    u8 pad0C[4];
} RangeEntry;

typedef struct RangeTable {
    u8 pad00[0x18];
    RangeEntry* entries;
} RangeTable;

void func_80034768(RangeTable* table, s32 first_arg, s32 count_arg, u32 amount) {
    register u32 first __asm__("$5") = (u16)first_arg;
    register u32 last __asm__("$6") = first + (u16)count_arg - 1;
    register RangeEntry* entries __asm__("$2") = table->entries;
    register u8* entry __asm__("$3") = (u8*)entries + 4;

    __asm__ volatile("" : "=r"(first) : "0"(first));
    if (last >= first) {
        entry = (u8*)(first * sizeof(RangeEntry) + (u32)entry);
        do {
            *(u32*)(entry + 8) += amount;
            first++;
            entry += sizeof(RangeEntry);
        } while (first <= last);
    }
}
