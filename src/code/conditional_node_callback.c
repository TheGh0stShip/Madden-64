#include "types.h"

typedef struct CallbackNode {
    u8 pad0[0x14];
    u32 flags;
    u8 pad18[0x3C];
    u16 callback_index;
} CallbackNode;

typedef struct CallbackEntry {
    u8 pad0[4];
    void (*callback)(void *object, void *context);
    u8 pad8[0x10];
} CallbackEntry;

extern CallbackEntry* D_800782FC;

void func_8000DBA4(CallbackNode *node, void *context) {
    CallbackEntry *entries;
    CallbackEntry *entry;
    u16 index;
    CallbackNode *saved_node;

    saved_node = node;
    if (saved_node->flags & 1) {
        index = saved_node->callback_index;
        entries = D_800782FC;
        entry = entries + index + 1;
        entry->callback(saved_node, context);
    }
}
