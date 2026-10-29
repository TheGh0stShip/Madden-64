#include "types.h"

typedef struct {
    u8 home;
    u8 away;
    u8 home_score;
    u8 away_score;
    u8 played;
    s8 state;
} Slot;

Slot *func_8008DC10(s16, s16);

s32 func_8008F89C(s32 team, u32 first, u32 last) {
    s32 wins = 0;
    u32 week;
    s32 i;
    Slot *slot;

    for (week = first; week <= last; week++) {
        for (i = 0; i < 15; i++) {
            slot = func_8008DC10(week, i);
            if (!(slot->played & 0xF) || slot->home == 0xFF) {
                continue;
            }
            if (slot->home == team) {
                wins += slot->home_score > slot->away_score;
            }
            if (slot->away == team) {
                wins += slot->away_score > slot->home_score;
            }
        }
    }
    return wins;
}
