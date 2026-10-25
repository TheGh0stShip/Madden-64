#include "types.h"

typedef struct AudioEntry {
    u8 active;
    u8 pad[3];
} AudioEntry;

typedef struct AudioEntryOwner {
    u8 pad[0x64];
    AudioEntry entries[10];
} AudioEntryOwner;

extern void func_80037C2C(AudioEntry* entry);

void func_80037D34(AudioEntryOwner* owner) {
    s32 index;

    for (index = 0; index < 10; index++) {
        if (owner->entries[index].active == 0) {
            break;
        }
        func_80037C2C(&owner->entries[index]);
    }
}
