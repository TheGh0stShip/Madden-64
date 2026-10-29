#include "types.h"

typedef struct {
    u8 home;
    u8 away;
    u8 homeScore;
    u8 awayScore;
    u8 flags;
} Game;

Game *func_8008DC10(s16, s16);

s32 func_800AAD00(s32 team, s32 weeks) {
    s32 count;
    s32 week;
    s32 slot;
    Game *game;

    count = 0;
    if (weeks > 16) {
        weeks = 17;
    }
    for (week = 0; week < weeks; week++) {
        for (slot = 0; slot < 15; slot++) {
            game = func_8008DC10(week, slot);
            if ((game->flags & 0xF) == 0) {
                continue;
            }
            if (game->home == 0xFF) {
                continue;
            }
            if (game->home == team) {
                count += game->homeScore > game->awayScore;
            }
            if (game->away == team) {
                count += game->awayScore > game->homeScore;
            }
        }
    }
    return count;
}
