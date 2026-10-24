#include "types.h"

typedef struct LinkedEntry {
    u32 pad0;
    s32 id;
    s32 values[4];
    struct LinkedEntry* next;
} LinkedEntry;

typedef struct LinkedEntryList {
    u8 pad0[0x18];
    LinkedEntry* head;
} LinkedEntryList;

extern LinkedEntryList* D_8008773C;

void func_80030194(s32 id, s32 value, u16 index) {
    LinkedEntry* entry = D_8008773C->head;

    while (entry != 0 && entry->id != id) {
        entry = entry->next;
    }
    if (entry->id == id) {
        entry->values[index] = value;
    }
}
