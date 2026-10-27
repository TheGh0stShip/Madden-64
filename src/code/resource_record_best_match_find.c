#include "types.h"

typedef struct ResourceRecord {
    u16 key;
    u8 pad02[6];
    u32 mode;
    u8 disabled;
    u8 pad0D[3];
    u32 priority;
} ResourceRecord;

extern u8 D_800724DA;
extern ResourceRecord *D_800724DC;

s32 func_80034BB8(s32 value)
{
    register s32 selected __asm__("$9") = -1;
    register u32 best_priority __asm__("$8") = -1;
    register u32 index __asm__("$6");
    u32 count;
    register ResourceRecord *first_records __asm__("$7");
    register ResourceRecord *second_records __asm__("$10");

    count = D_800724DA;
    index = 0;
    if (count == 0) goto done;
    first_records = D_800724DC;
first_loop:
    if (value < first_records[(u16)index].key) {
        value = first_records[(u16)index].key;
        goto first_done;
    }
    index++;
    if ((u16)index < count) goto first_loop;
first_done:

    count = D_800724DA;
    index = 0;
    if (count == 0) goto done;
    second_records = D_800724DC;
second_loop:
    {
        ResourceRecord *record = &second_records[(u16)index];

        if ((record->mode == 2 || record->mode == 0) &&
            record->disabled == 0 && record->key == value &&
            record->priority < best_priority) {
            best_priority = record->priority;
            selected = index;
        }
        index++;
    }
    if ((u16)index < count) goto second_loop;
done:
    return (s16)selected;
}
