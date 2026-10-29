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

extern void func_800E4880(SlotOwner *owner, SlotEntry *entry);
extern void func_800E47C4(SlotOwner *owner);

void func_800E61A4(SlotOwner *owner, SlotEntry *entry) {
    u16 i;

    i = 0;
    while (owner->slots[i].active != 0 && i < 10) {
        i++;
    }
    if (i != 0) {
        while (i >= 2) {
            owner->slots[i].active = owner->slots[i - 1].active;
            owner->slots[i].b1 = owner->slots[i - 1].b1;
            owner->slots[i].b2 = owner->slots[i - 1].b2;
            owner->slots[i].b3 = owner->slots[i - 1].b3;
            i--;
        }
        owner->slots[1].active = entry->active;
        owner->slots[1].b1 = entry->b1;
        owner->slots[1].b2 = entry->b2;
        owner->slots[1].b3 = entry->b3;
    } else {
        func_800E4880(owner, entry);
        owner->slots[1].active = 0;
        func_800E47C4(owner);
    }
}
