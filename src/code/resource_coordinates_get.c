#include "types.h"

typedef struct ResourceTable {
    u8 pad0[0x2C];
    void** entries;
} ResourceTable;

typedef struct ResourceOwner {
    u8 pad0[8];
    ResourceTable* table;
} ResourceOwner;

typedef struct Coordinates {
    s32 first;
    s32 second;
} Coordinates;

extern s16* func_80017C7C(void* resource);

void func_8001F070(ResourceOwner* owner, s32 index, Coordinates* output) {
    void* resource = owner->table->entries[index];
    s16* coordinates;

    if (resource != 0) {
        coordinates = func_80017C7C(resource);
        output->first = coordinates[0];
        output->second = coordinates[1];
    }
}
