#include "types.h"

typedef struct {
    u32 id : 7;
    u32 a : 7;
    u32 b : 13;
    u32 c : 5;
} FrameEntry;

extern u8 *D_8006B9DC;

u8 func_80024B90(u16 frame);
u8 func_80024BD4(u16 frame);
s32 frame_identifier_find(u32 identifier);

s32 frame_resource_finalize(u16 frame, u16 attribute) {
    s16 kind = -1;
    s32 offset = 0;
    s32 count = 2;
    FrameEntry *entry;
    u16 group;
    u16 id;
    s16 i;

    switch (attribute) {
    case 0x21:
        kind = 0;
        break;
    case 0x22:
        kind = 1;
        break;
    case 0x23:
        kind = 2;
        break;
    case 0x24:
        kind = 0;
        offset = 0xF0;
        count = 1;
        break;
    case 0x25:
        kind = 1;
        offset = 0xF0;
        count = 1;
        break;
    case 0x26:
        kind = 2;
        offset = 0xF0;
        count = 1;
        break;
    }
    entry = (FrameEntry *)(D_8006B9DC + (offset + 0x5A9C));
    group = func_80024B90(frame);
    id = func_80024BD4(frame);
    if (group == 0xFF) {
        return 0;
    }
    entry += (u16)frame_identifier_find(group) * count;
    for (i = 0; i < count; i++, entry++) {
        if (id == entry->id) {
            break;
        }
    }
    if (i == count) {
        kind = -1;
    }
    switch (kind) {
    case 0:
        return entry->a;
    case 1:
        return entry->b;
    case 2:
        return entry->c;
    }
    return 0;
}
