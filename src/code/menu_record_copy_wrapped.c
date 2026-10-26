#include "types.h"

typedef struct MenuPackedRecord {
    u32 words[3];
} __attribute__((packed)) MenuPackedRecord;

extern u8 D_800895D8;
extern MenuPackedRecord D_80080AA0[];

void menu_record_copy_wrapped(u8 offset, MenuPackedRecord *destination)
{
    s32 index = (D_800895D8 + offset) % 30;

    *destination = D_80080AA0[index];
}
