#include "types.h"

extern u8 D_80081860[];

u8 func_800297FC(u8 *object) {
    s32 record_index;
    s32 entry_index;
    u8 *lookup_base;
    s32 result = 0xFF;
    s32 record_offset;
    s32 entry_offset;
    u8 *record;

    if (object != 0) {
        record_index = object[0x1E];
        record_offset = record_index * 0x214C;
        entry_index = object[0x1F];
        lookup_base = D_80081860;
        entry_offset = 2 * entry_index;
        record = lookup_base + record_offset;
        result = record[entry_offset + 1];
        result = (s8) result;
        result &= 0xFF;
        if (record_index != 0) {
            result |= 0x80;
        }
    }

    return result;
}
