#include "types.h"

typedef struct {
    u16 unk_00;
    u8 unk_02[0x214A];
} TeamRecord;

extern TeamRecord D_80082D94[];

s16 team_stat_value_get(u16, u16, s32);

s32 gameplay_selection_update(s32 team, s32 player) {
    s32 score;
    s16 value;

    score = team_stat_value_get(team, player, 6) * 3;
    score += team_stat_value_get(team, player, 11) * 6;
    score += team_stat_value_get(team, player, 15) * 3;
    score += team_stat_value_get(team, player, 20) * 3;
    score += team_stat_value_get(team, player, 22) * 3;
    score += team_stat_value_get(team, player, 17) * 3;
    score += team_stat_value_get(team, player, 16);
    score += (s16)(team_stat_value_get(team, player, 5) / 50);
    score += (s16)(team_stat_value_get(team, player, 10) / 25);
    score += (s16)(team_stat_value_get(team, player, 14) / 25);

    value = team_stat_value_get(team, player, 5);
    if (value > 500) {
        score += 10;
    } else if (value > 400) {
        score += 5;
    } else if (value > 300) {
        score += 2;
    } else if (value > 200) {
        score += 1;
    }

    value = team_stat_value_get(team, player, 14);
    if (value > 300) {
        score += 5;
    } else if (value > 200) {
        score += 3;
    } else if (value > 100) {
        score += 1;
    }

    value = team_stat_value_get(team, player, 10);
    if (value > 300) {
        score += 5;
    } else if (value > 200) {
        score += 3;
    } else if (value > 100) {
        score += 1;
    }

    if (D_80082D94[team].unk_00 > D_80082D94[team ^ 1].unk_00) {
        score += 5;
    }
    if (score < 0) {
        score = 0;
    }
    return score;
}
