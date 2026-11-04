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
    u32 first = (u16)first_arg;
    u32 last = first + (u16)count_arg - 1;
    RangeEntry* entries = table->entries;
    volatile RangeEntry* entry = (RangeEntry*)((u8*)entries + 4);
    u32 entry_address;
    u32 entry_offset;

    if (last >= first) {
        entry_offset = first * sizeof(RangeEntry);
        entry_address = entry_offset;
        entry_address += (u32)entry;
        entry = (volatile RangeEntry*)entry_address;
        do {
            entry->value += amount;
            first++;
            entry++;
        } while (first <= last);
    }
}
