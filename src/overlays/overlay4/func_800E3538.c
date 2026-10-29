#include "types.h"

typedef struct {
    u8 active;
    u8 pad[3];
} SlotEntry;

typedef struct {
    u8 pad00[0x64];
    SlotEntry slots[10];
} SlotOwner;

extern void func_800E47C4(SlotOwner *owner);

void func_800E3538(SlotOwner *owner) {
    u16 i;

    for (i = 0; i < 10; i++) {
        owner->slots[i].active = 0;
        func_800E47C4(owner);
    }
}
