#include "types.h"
/* gameplay_interface_configure: fill five team-stat values for a player, picking a stat row by the
 * player's position class (low six bits of the record byte); code 0xF sums four stats. */

typedef struct GameplayRecord {
    u8 values[55][40];
    u8 pad898[0x18B4];
} GameplayRecord;

extern GameplayRecord D_80080D78[];
extern u16 D_8006BAE4[3][5];
s16 team_stat_value_get(u16, u16, s32);

void gameplay_interface_configure(s32 team, s32 player, s16 *out)
{
    s32 v;
    s32 row;
    s32 i;
    u16 code;

    v = D_80080D78[team].values[player][0] & 0x3F;
    if (v == 0) {
        row = 0;
    } else if (v < 0xA) {
        row = 1;
    } else {
        row = 2;
    }
    for (i = 0; i < 5; i++) {
        code = D_8006BAE4[row][i];
        if (code != 0x7FFF) {
            if (code != 0xF) {
                out[i] = team_stat_value_get(team, player, code);
            } else {
                out[i] = team_stat_value_get(team, player, 0xF) + team_stat_value_get(team, player, 0xB)
                       + team_stat_value_get(team, player, 0x23) + team_stat_value_get(team, player, 0x26);
            }
        }
    }
}
