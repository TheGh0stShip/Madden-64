#include "types.h"

extern u16 D_80080CFC;
extern u32 func_8002A358(u32 team, u32 slot);

u32 team_best_slot_find(u32 team)
{
    register u32 saved_team __asm__("$18") = team;
    register u32 best_value __asm__("$19") = 0;
    register u32 best_slot __asm__("$20") = 0;
    register u32 slot __asm__("$16") = 0;
    register u32 sentinel __asm__("$21") = 0xFFFF;
    register u16 *entry __asm__("$17");
    register u16 *base __asm__("$3");
    register u32 team_offset __asm__("$2");

    __asm__("" : "=r"(saved_team), "=r"(best_value),
            "=r"(best_slot), "=r"(sentinel)
            : "0"(saved_team), "1"(best_value),
              "2"(best_slot), "3"(sentinel));
    team_offset = saved_team * 8524;
    __asm__("" : "=r"(team_offset) : "0"(team_offset));
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
