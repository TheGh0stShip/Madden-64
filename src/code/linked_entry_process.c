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
extern void func_800301E0(LinkedEntry* entry, u16 index);

void func_800301F8(s32 id, u16 index) {
    LinkedEntry* entry = D_8008773C->head;

    while (entry != 0 && entry->id != id) {
        entry = entry->next;
    }
    if (entry->id == id) {
        func_800301E0(entry, index);
    }
}
