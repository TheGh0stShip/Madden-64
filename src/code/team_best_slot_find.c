#include "types.h"

extern u16 D_80080CFC;
extern u32 func_8002A358(u32 team, u32 slot);

u32 team_best_slot_find(u32 team)
{
    u32 saved_team = team;
    u32 best_value = 0;
    u32 best_slot = 0;
    u32 slot = 0;
    u32 sentinel = 0xFFFF;
    u16 *entry;
    u16 *base;
    u32 team_offset;

    team_offset = saved_team * 8524;
    base = &D_80080CFC;
    entry = (u16 *)(team_offset + (u32)base);
    for (; (s32)slot < 55; slot++, entry++) {
        if (*entry == sentinel) {
            continue;
        }
        {
        u32 value = func_8002A358(saved_team, slot);
        if (best_value >= value) {
                continue;
            }
            best_slot = slot;
            best_value = value;
        }
    }
    return best_slot;
}
