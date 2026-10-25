#include "types.h"

typedef struct ListEntry {
    struct ListEntry *next;
    u8 pad04[0x20];
    void *object;
    u8 pad28[0xC];
    s16 value34;
    s16 value36;
} ListEntry;

extern ListEntry *D_800855F8;
extern u8 D_80074824[];
extern void func_800B96C0(void *object, u8 *data);

void object_list_apply(void)
{
    ListEntry *entry = D_800855F8;

    while (entry != 0) {
        u32 *flags = (u32 *)((u8 *)entry->object + 0x14);
        *flags |= 0x200;
        entry->value34 = 0x25;
        entry->value36 = 8;
        func_800B96C0(entry->object, D_80074824);
        *(s16 *)((u8 *)entry->object + 0x3E) = 0;
        *(s16 *)((u8 *)entry + 0x30) = 0;
        entry = entry->next;
    }
}
