#include "types.h"

typedef struct CallbackEntry {
    void (*callback)(void* object);
    u8 pad4[0x14];
} CallbackEntry;

typedef struct CallbackNode {
    u8 pad0[0x18];
    void* value;
    u8 pad1C[0x38];
    u16 callback_index;
} CallbackNode;

extern CallbackEntry* D_800782FC;

void func_8000DC2C(CallbackNode* node, void* value) {
    u16 index = node->callback_index;
    CallbackEntry* entries = D_800782FC;
    CallbackEntry* entry;

    node->value = value;
    entry = entries + index + 1;
    entry->callback(node);
}
