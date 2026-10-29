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

/* Tie-break between teams A and B: ranking score, division, head-to-head record, then the standings tie-break. */
s16 func_8009024C(s16 a, s16 b) {
    Standing sa;
    Standing sb;
    s16 wins_a;
    s16 wins_b;
    s16 week;
    s16 game;
    Slot *slot;

    sa.team = a;
    sb.team = b;
    func_80090030(&sa);
    func_80090030(&sb);
    if (sa.score > sb.score) {
        return a;
    }
    if (sa.score < sb.score) {
        return b;
    }
    if ((s8)sa.division < (s8)sb.division) {
        return a;
    }
    if ((s8)sa.division > (s8)sb.division) {
        return b;
    }
    wins_b = 0;
    wins_a = 0;
    for (week = 0; week < 22; week++) {
        for (game = 0; game < 15; game++) {
            slot = func_8008DC10(week, game);
            if (slot->home == sa.team && slot->away == sb.team && (slot->played & 0xF) == 8) {
                if (slot->home_score > slot->away_score) {
                    wins_a++;
                }
                if (slot->home_score < slot->away_score) {
                    wins_b++;
                }
            }
            if (slot->home == sb.team && slot->away == sa.team && (slot->played & 0xF) == 8) {
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
    if (func_80090450(&sa, &sb) != &sb) {
        return a;
    }
    return b;
}
