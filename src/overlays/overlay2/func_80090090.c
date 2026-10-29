#include "types.h"

typedef struct {
    u8 home;
    u8 away;
    u8 home_score;
    u8 away_score;
    u8 played;
    s8 state;
} Slot;

/* A team's standing entry: team id, ranking score (2*wins + ties/2), division. */
typedef struct {
    u8 team;
    s8 score;
    u8 division;
} Standing;

void func_80090030(Standing *entry);
Slot *func_8008DC10(s16 week, s16 game);
Standing *func_80090450(Standing *a, Standing *b);

/* Tie-break between two teams: ranking score, then head-to-head record, then the standings tie-break. */
Standing *func_80090090(Standing *a, Standing *b) {
    s16 wins_a;
    s16 wins_b;
    s16 week;
    s16 game;
    Slot *slot;

    func_80090030(a);
    func_80090030(b);
    if (a->score > b->score) {
        return a;
    }
    if (a->score < b->score) {
        return b;
    }
    wins_b = 0;
    wins_a = 0;
    for (week = 0; week < 22; week++) {
        for (game = 0; game < 15; game++) {
            slot = func_8008DC10(week, game);
            if (slot->home == a->team && slot->away == b->team && (slot->played & 0xF) == 8) {
                if (slot->home_score > slot->away_score) {
                    wins_a++;
                }
                if (slot->home_score < slot->away_score) {
                    wins_b++;
                }
            }
            if (slot->home == b->team && slot->away == a->team && (slot->played & 0xF) == 8) {
                if (slot->home_score > slot->away_score) {
                    wins_b++;
                }
                if (slot->home_score < slot->away_score) {
                    wins_a++;
                }
            }
        }
    }
    if (wins_a > wins_b) {
        return a;
    }
    if (wins_a < wins_b) {
        return b;
    }
    return func_80090450(a, b);
}
