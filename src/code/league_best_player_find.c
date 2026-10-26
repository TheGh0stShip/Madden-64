#include "types.h"

extern u16 D_80080CFC;
extern u32 func_80022AD8(u32 team, u32 slot);
extern u32 func_8002A358(u32 team, u32 slot);

u32 league_best_player_find(void)
{
    register u32 best_value __asm__("$20") = 0;
    register u16 *base __asm__("$2") = &D_80080CFC;
    register u32 best_player __asm__("$21");
    register u32 team __asm__("$18");
    register u16 *team_entries __asm__("$19");
    register u32 slot __asm__("$16");
    register u16 *entry __asm__("$17");

    __asm__("" : "=r"(best_value), "=r"(base)
            : "0"(best_value), "1"(base));
    best_player = *base;
    team = 0;
    team_entries = base;
    for (; (s32)team < 2; team++, team_entries += 4262) {
        slot = 0;
        entry = team_entries;
        for (; (s32)slot < 55; slot++, entry++) {
            register u32 sentinel __asm__("$2") = 0xFFFF;
            u32 value;

            __asm__("" : "=r"(sentinel) : "0"(sentinel));
            if (*entry == sentinel) {
                continue;
            }
            if ((u8)func_80022AD8((u16)team, (u16)slot) >= 10) {
                continue;
            }
            value = func_8002A358(team, slot);
            if (value > best_value) {
                best_player = *entry;
                best_value = value;
            }
        }
    }
    return best_player;
}
