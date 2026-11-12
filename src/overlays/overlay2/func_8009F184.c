#include "types.h"

typedef struct {
    u16 values[16];
    s16 flags[16];
    u16 selected;
} EntryList;

extern u8 D_800C4EEB;

void func_800A2170(s16, EntryList *, s16 *);

void func_8009F184(EntryList *list) {
    u16 i;

    do {
        list->values[list->selected] = 0x16;
    } while (0);
    for (i = 0; i < (u16)(s8)D_800C4EEB; i++) {
        if (list->flags[i] == 1 &&
            list->values[i] == list->values[list->selected]) {
            func_800A2170((s16)list->selected, list, list->flags);
            break;
        }
    }
}
