#include "types.h"

typedef struct {
    u8 active;
    u8 b1;
    u8 b2;
    u8 b3;
} SlotEntry;

typedef struct {
    u8 pad00[0x64];
    SlotEntry slots[10];
} SlotOwner;

extern void func_800E1A84(SlotOwner *owner, SlotEntry *entry);

void func_800E33A0(SlotOwner *owner, SlotEntry *entry) {
    u16 i;

    i = 0;
    while (owner->slots[i].active != 0) {
        i++;
    }
    if (i != 0) {
        owner->slots[i].active = entry->active;
        owner->slots[i].b1 = entry->b1;
        owner->slots[i].b2 = entry->b2;
        owner->slots[i].b3 = entry->b3;
    } else {
        func_800E1A84(owner, entry);
    }
    if (i != 9) {
        owner->slots[i + 1].active = 0;
    }
}
