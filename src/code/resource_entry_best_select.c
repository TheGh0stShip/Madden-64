#include "types.h"

extern u8 D_800724DA;
extern u8 *D_800724DC;

s32 resource_entry_best_select(s32 threshold)
{
    s16 best_index = -1;
    u32 best_cost = (u32)-1;
    u16 index;

    for (index = 0; index < D_800724DA; index++) {
        u32 offset = index * 0x14;
        u8 *entry = (u8 *)(offset + (u32)D_800724DC);
        u32 state = *(u32 *)(entry + 8);
        u32 cost;

        if ((state == 2 || state == 0) && entry[0x0C] == 0 &&
            threshold < *(u16 *)entry) {
            cost = *(u32 *)(entry + 0x10);
            if (cost < best_cost) {
                best_cost = cost;
                best_index = index;
            }
        }
    }
    return best_index;
}
