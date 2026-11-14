#include "types.h"

typedef struct {
    u8 home;
    u8 away;
    u8 home_score;
    u8 away_score;
    u8 played;
    s8 state;
} Slot;

/* Season record: overall, division and conference W/L/T, then points for/against. */
typedef struct {
    u8 wins;
    u8 losses;
    u8 ties;
    u8 div_wins;
    u8 div_losses;
    u8 div_ties;
    u8 conf_wins;
    u8 conf_losses;
    u8 conf_ties;
    u8 pad9;
    u16 points_for;
    u16 points_against;
} TeamRecord;

typedef struct {
    u8 pad[0x60];
    u8 conference;
    u8 division;
} TeamInfo;

typedef struct {
    s8 cur;
} SeasonState;

extern SeasonState D_800C509C;

Slot *func_8008DC10(s16 week, s16 game);
TeamRecord *func_8008DBEC(u8 team);
TeamInfo *func_8003A7B8(u8 team);

/* Post this week's played games into the season records. */
void func_8008E444(void) {
    s16 game = 0;
    SeasonState *season = &D_800C509C;
    s32 one = 1;
    Slot *slot;
    TeamRecord *home;
    TeamRecord *away;
    TeamInfo *hi;
    TeamInfo *ai;
    s8 same_conf;
    u8 same_div;

    for (; game < 15; game++) {
        slot = func_8008DC10(season->cur, game);
        if ((slot->played & 0xF) != 7) {
            continue;
        }
        if (season->cur >= 17) {
            slot->played = (slot->played & 0xF0) | 8;
        }
        if ((slot->played & 0xF) != 7) {
            continue;
        }
        slot->played = (slot->played & 0xF0) | 8;
        home = func_8008DBEC(slot->home);
        away = func_8008DBEC(slot->away);
        home->points_for += slot->home_score;
        home->points_against += slot->away_score;
        away->points_for += slot->away_score;
        away->points_against += slot->home_score;
        hi = func_8003A7B8(slot->home);
        ai = func_8003A7B8(slot->away);
        same_conf = 0;
        same_div = 0;
        if (hi->conference == ai->conference) {
            same_conf = 1;
            same_div = hi->division == ai->division;
        }
        if (slot->away_score > slot->home_score) {
            home->losses++;
            away->wins++;
            if (same_conf == one) {
                home->div_losses++;
                away->div_wins++;
                if (same_div == one) {
                    home->conf_losses++;
                    away->conf_wins++;
                }
            }
        }
        if (slot->away_score < slot->home_score) {
            home->wins++;
            away->losses++;
            if (same_conf == one) {
                home->div_wins++;
                away->div_losses++;
                if (same_div == one) {
                    home->conf_wins++;
                    away->conf_losses++;
                }
            }
        }
        if (slot->away_score == slot->home_score) {
            home->ties++;
            away->ties++;
            if (same_conf == one) {
                home->div_ties++;
                away->div_ties++;
                if (same_div == same_conf) {
                    home->conf_ties++;
                    away->conf_ties++;
                }
            }
        }
    }
}
