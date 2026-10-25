#include "types.h"

typedef struct RuntimeEntry {
    u32 unused;
    void *key;
    void *state;
    u8 count;
    u8 slot;
    u8 pad[2];
    u32 value;
} RuntimeEntry;

extern u8 D_800724DA;
extern RuntimeEntry *D_800724DC;

void runtime_entries_reset(void)
{
    u32 index;

    for (index = 0; index < D_800724DA; index++) {
        RuntimeEntry *entry = (RuntimeEntry *)(index * sizeof(RuntimeEntry) +
                                               (u32)D_800724DC);

        entry->count = 0;
        entry->state = (void *)2;
        D_800724DC[index].slot = 0xFF;
        D_800724DC[index].value = 0;
    }
}
