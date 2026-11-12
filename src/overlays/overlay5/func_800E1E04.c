#include "types.h"

typedef struct EntryE1E04 {
    u8 pad[0x34];
    u32 flags;
    u8 rest[0x18];
} EntryE1E04;

extern EntryE1E04 *D_80085018;

s32 func_800E1E04(s32 raw) {
    EntryE1E04 *base = D_80085018;
    s16 index = raw;
    s32 offset;
    s32 entry;

    offset = (index << 2) + index;
    entry = (offset << 4) + (s32)base;

    return entry & -((((EntryE1E04 *)entry)->flags & ~0xFF) != 0);
}
