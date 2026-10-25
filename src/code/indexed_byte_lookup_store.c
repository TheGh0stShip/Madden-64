#include "types.h"

typedef struct LookupTable {
    u8 pad0[0x80];
    u8 values[1];
} LookupTable;

typedef struct LookupOwner {
    u8 pad0[0x140];
    LookupTable* table;
} LookupOwner;

typedef struct LookupSource {
    u8 pad0[0x50];
    s32* scale;
} LookupSource;

void func_8005EE48(LookupOwner* owner, LookupSource* source, s16* index,
                   u8** destination, s32 offset) {
    s32* scale = source->scale;
    s32 table_index = *index;
    LookupTable* table;

    table_index *= *scale;
    table = owner->table;
    table_index = (table_index + 4) >> 3;
    (*destination)[offset] = table->values[table_index & 0x3FF];
}
