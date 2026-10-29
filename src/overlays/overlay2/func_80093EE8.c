#include "types.h"

typedef struct {
    u8 home;
    u8 away;
    u8 home_score;
    u8 away_score;
    u8 played;
    s8 state;
} Slot;

Slot *func_8008DC10(s16 week, s16 game);

/* Whether two scheduled games share a team. */
s32 func_80093EE8(s16 week_a, s16 game_a, s16 week_b, s16 game_b) {
    Slot *a;
    Slot *b;

    a = func_8008DC10(week_a, game_a);
    b = func_8008DC10(week_b, game_b);
    if (a->home == b->home || a->home == b->away || a->away == b->home || a->away == b->away) {
        return 1;
    }
    return 0;
}
