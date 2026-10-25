#include "types.h"

typedef struct RangeEntry {
    u16 start;
    u8 tail[0x2A];
} RangeEntry;

extern RangeEntry D_8007A912[];
extern void func_80035F88(u16 channel, s32 value);

void indexed_range_submit(u16 channel, u16 entry_index) {
    u16 offset = 0;
    s32 start = D_8007A912[entry_index].start;

    do {
        func_80035F88(channel, start + offset);
        offset++;
    } while (offset < 8);
}
