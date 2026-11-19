#include "m2c.h"

typedef struct { u8 home, away, homeScore, awayScore, flags; } Game;
Game *func_8009D69C(s32 week, s32 game);
extern s8 D_80072038[];
extern s8 D_80072040[];
extern s8 D_800C4AD2;
extern s16 D_800C502C;
s32 func_8009D82C(s32 team) {
    s32 week;
    s32 game;
    s32 count = 0;
    s32 games;
    Game *g;
    for (week = 0; week < D_800C502C; week++) {
        if (D_800C4AD2 == 4) {
            games = D_80072038[week];
        } else {
            games = D_80072040[week];
        }
        for (game = 0; game < games; game++) {
            g = func_8009D69C(week, game);
            if (g->flags & 0xF) {
                if (team == g->home) {
                    count += g->homeScore < g->awayScore;
                }
                if (team == g->away) {
                    count += g->awayScore < g->homeScore;
                }
            }
        }
    }
    return count;
}
