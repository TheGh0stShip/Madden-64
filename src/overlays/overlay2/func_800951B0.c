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

u8 func_800951B0(s32 team, u8 week) {
    s32 i;
    Slot *slot;

    for (i = 0; i < 15; i++) {
        slot = func_8008DC10(week, i);
        if (slot->played == 0 || slot->home == 0xFF) {
            continue;
        }
        if (slot->home == team) {
            if (slot->home_score > slot->away_score) {
                return 0;
            }
            if (slot->home_score < slot->away_score) {
                return 1;
            }
        }
        if (slot->away == team) {
            if (slot->away_score > slot->home_score) {
                return 0;
            }
            if (slot->away_score < slot->home_score) {
                return 1;
            }
        }
    }
    return 2;
}
