#include "types.h"

typedef struct ListEntry {
    u32 pad0;
    s32 value;
    u8 pad8[4];
    struct ListEntry* link;
    struct ListEntry* owner;
} ListEntry;

extern void func_8003359C(ListEntry* entry, s16 mode);

void func_800334E0(ListEntry* owner, ListEntry* entry, s16 mode) {
    owner->value += entry->value;
    owner->link = entry->link;
    if (entry->link != (ListEntry*)-1) {
        entry->link->owner = owner;
    }
    func_8003359C(entry, mode);
}
