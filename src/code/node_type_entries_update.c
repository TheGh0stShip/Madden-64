#include "types.h"

typedef struct NodeEntry {
    u8 pad0[4];
    struct NodeEntry* next;
    u8 pad8[0x4C];
    u16 type;
} NodeEntry;

typedef struct NodeEntryOwner {
    u8 pad0[8];
    NodeEntry* first;
} NodeEntryOwner;

extern void func_8000E424(NodeEntry* entry, void* value);

void func_8000E430(NodeEntryOwner* owner, void* value) {
    NodeEntry* entry = owner->first;

    while (entry != 0) {
        if (entry->type == 8) {
            func_8000E424(entry, value);
        }
        entry = entry->next;
    }
}
