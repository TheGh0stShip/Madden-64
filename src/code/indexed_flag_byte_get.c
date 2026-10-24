#include "types.h"

extern u8 D_80081860[];

u8 func_800297FC(u8* object) {
    register s32 record_index __asm__("$5");
    register s32 entry_index __asm__("$3");
    register u8* lookup_base __asm__("$4");
    register u8 result __asm__("$2") = 0xFF;
    s32 record_offset;
    s32 entry_offset;
    u8* record;

    if (object != 0) {
        record_index = object[0x1E];
        __asm__ volatile ("" : : "r"(record_index));
        entry_index = object[0x1F];
        lookup_base = D_80081860;
        __asm__ volatile ("" : : "r"(lookup_base));
        record_offset = record_index * 0x214C;
        __asm__ volatile ("" : : "r"(record_offset));
        entry_offset = entry_index * 2;
        __asm__ volatile ("" : : "r"(entry_offset));
        record = lookup_base + record_offset;
        __asm__ volatile ("" : : "r"(record));
        result = record[entry_offset + 1];
        if (record_index != 0) {
            result |= 0x80;
        }
    }

    return result;
}
