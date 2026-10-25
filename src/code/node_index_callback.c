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
    register u16 index __asm__("$6") = node->callback_index;
    CallbackEntry* entries = D_800782FC;
    register CallbackEntry* entry __asm__("$3");

    node->value = value;
    entry = entries + index + 1;
    entry->callback(node);
}
