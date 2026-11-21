#include "types.h"

typedef struct {
    u16 values[0x10A6];
} TeamStats;

extern u16 D_8006B9D8;
extern u8 *D_8006B9DC;
extern TeamStats D_80082D22[];

s16 team_stat_value_get(u32 team, u32 index, u32 stat);
u16 frame_identifier_find(u32 identifier);

s16 roster_stat_process(u16 team, u16 stat) {
    u16 value;
    u16 i;
    s16 *row;

    if (D_8006B9D8 == 0) {
        switch (stat) {
        case 33:
            value = roster_stat_process(team, 10) - roster_stat_process(team, 0);
            break;
        case 32:
            value = D_80082D22[team].values[57];
            break;
        case 23:
            value = D_80082D22[(u16)(team ^ 1)].values[0];
            break;
        case 24:
            value = D_80082D22[(u16)(team ^ 1)].values[1];
            break;
        case 25:
            value = D_80082D22[(u16)(team ^ 1)].values[2];
            break;
        case 26:
            value = D_80082D22[(u16)(team ^ 1)].values[3];
            break;
        case 27:
            value = roster_stat_process(team, 28) + roster_stat_process(team, 29);
            break;
        case 28:
            value = 0;
            for (i = 0; i < 55; i++) {
                s16 v = team_stat_value_get(team, i, 9);
                if ((u16)v != 0x8000) {
                    value += v;
                }
            }
            break;
        case 29:
            value = 0;
            for (i = 0; i < 55; i++) {
                s16 v = team_stat_value_get(team, i, 3);
                if ((u16)v != 0x8000) {
                    value += v;
                }
            }
            break;
        case 30:
            value = 0;
            for (i = 0; i < 55; i++) {
                s16 v = team_stat_value_get(team, i, 39);
                if ((u16)v != 0x8000) {
                    value += v;
                }
            }
            break;
        default:
            value = D_80082D22[team].values[stat];
            break;
        }
        return value;
    }
    row = (s16 *)(D_8006B9DC + (frame_identifier_find(team) * 0x3E + 0x5358));
    return row[stat];
}
