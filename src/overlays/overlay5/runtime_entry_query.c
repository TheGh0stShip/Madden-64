#include "types.h"

typedef struct RuntimeCallbackEntry {
    u8 pad0[8];
    s16 (*query)(void* object, s16 value);
    u32 update;
} RuntimeCallbackEntry;
typedef struct RuntimeCallbackTable { RuntimeCallbackEntry* entries; } RuntimeCallbackTable;
typedef struct RuntimeCallbackObject { u8 pad0[8]; u8 type; } RuntimeCallbackObject;

extern RuntimeCallbackTable* D_80072460;

s16 func_800E0B20(RuntimeCallbackObject* object, s16 value) {
    return D_80072460->entries[object->type].query(object, value);
}
