#include "types.h"

extern u8 D_800724DA;
extern u8 *D_800724DC;

s32 runtime_entry_find_available(u16 key)
{
    u16 index;

    for (index = 0; index < D_800724DA; index++) {
        u32 offset = index * 0x14;
        u8 *entry = (u8 *)(offset + (u32)D_800724DC);
        u32 state = *(u32 *)(entry + 8);

        if ((state == 2 || state == 0) && entry[0x0C] == 0 &&
            key < *(u16 *)entry) {
            return (s16)index;
        }
    }
    return -1;
}
