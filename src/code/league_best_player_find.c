#include "types.h"

extern u16 D_80080CFC[][4262];
extern u32 func_80022AD8(u32 team, u32 slot);
extern u32 gameplay_selection_update(u32 team, u32 slot);

u32 league_best_player_find(void)
{
    u32 best_value = 0;
    u32 best_player = D_80080CFC[0][0];
    s32 team;
    s32 slot;

    for (team = 0; team < 2; team++) {
        for (slot = 0; slot < 55; slot++) {
            u32 value;

            if (D_80080CFC[team][slot] == 0xFFFF) {
                continue;
            }
            if ((u8)func_80022AD8((u16)team, (u16)slot) >= 10) {
                continue;
            }
            value = gameplay_selection_update(team, slot);
            if (value > best_value) {
                best_player = D_80080CFC[team][slot];
                best_value = value;
            }
        }
    }
    return best_player;
}
