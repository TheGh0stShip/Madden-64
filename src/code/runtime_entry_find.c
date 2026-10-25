#include "types.h"

extern u8 D_800724DA;
extern u8 *volatile D_800724DC;

u32 runtime_entry_find(u32 value, s16 *index_out)
{
    register u32 key __asm__("$4");
    register u32 masked __asm__("$2");
    register u32 index __asm__("$6");
    register u32 offset __asm__("$3");
    u32 count = D_800724DA;
    volatile u64 unused;

    index = 0;
    if (count != 0) {
        masked = value & 0xFF00;
        key = masked >> 8;
        offset = 0;
        do {
            u8 *entry = (u8 *)(offset + (u32)D_800724DC);

            if (entry[0x0D] == key) {
                register u8 *found __asm__("$2");

                *index_out = index;
                found = (u8 *)(offset + (u32)D_800724DC);
                return *(u16 *)(found + 0x0A);
            }
            index++;
            offset += 0x14;
        } while (index < D_800724DA);
    }
    *index_out = -1;
    return 3;
}
