#include "types.h"

typedef struct Overlay5LinkedEntry {
    u8 pad00[4];
    struct Overlay5LinkedEntry *next;
    u8 pad08[4];
    void *key;
    u8 value;
} Overlay5LinkedEntry;

typedef struct Overlay5LinkedResource {
    u8 pad00[8];
    Overlay5LinkedEntry *entries;
    u8 pad0C[0x10];
    u8 target;
} Overlay5LinkedResource;

typedef struct Overlay5LinkedOwner {
    u8 pad00[0xC];
    Overlay5LinkedResource *resource;
} Overlay5LinkedOwner;

void func_800DC6F8(u8 *target, u8 value);

void overlay5_resource_linked_entry_apply(
    Overlay5LinkedOwner *owner,
    void *key
) {
    Overlay5LinkedResource *resource;
    Overlay5LinkedEntry *entry;

    resource = owner->resource;
    entry = resource->entries;
    while (entry != 0) {
        if (entry->key == key) {
            func_800DC6F8(&resource->target, entry->value);
            break;
        }
        entry = entry->next;
    }
}
