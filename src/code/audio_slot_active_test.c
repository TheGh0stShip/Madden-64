#include "types.h"

extern u8 D_80081860[];
extern u8 D_80082D84[];

s32 audio_slot_active_test(u8 *object)
{
    s16 index;
    u32 inactive;
    u32 entry_base;
    u32 key;
    u32 value;
    u32 offset;
    u8 *base;
    u8 *slot;
    s16 signed_value;

    value = object[0x1E];
    index = 0;
    inactive = 0x80;
    base = D_80081860;
    offset = value * 8524;
    value = object[0x1F];
    slot = base + offset;
    base -= 0xB64;
    signed_value = *(s16 *)(slot + value * 2);
    entry_base = offset;
    key = *(u16 *)(entry_base + base + signed_value * 2);
    for (; index < 4; index++) {
        u32 entry_offset = index * 4 + entry_base;

        if (*(u16 *)(D_80082D84 + entry_offset) != key) {
            continue;
        }
        if (*(u8 *)(D_80082D84 + entry_offset + 3) == inactive) {
            continue;
        }
        return 1;
    }
    return 0;
}
