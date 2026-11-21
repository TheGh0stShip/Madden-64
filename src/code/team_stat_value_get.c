#include "types.h"

typedef struct {
    /* 0x000 */ u16 players[0x5BD];
    /* 0xB7A */ s16 stats[59][0x2F];
    /* 0x2124 */ u8 unk_2124[0x28];
} TeamData;

extern TeamData D_80080CFC[];
extern u16 D_8006B9D8;
s16 func_80023F94(u16 player, u16 stat);
s16 frame_resource_finalize(u16 player, u16 stat);

s16 team_stat_value_get(u16 team, u16 index, u16 stat)
{
    u16 player = D_80080CFC[team].players[index];

    if (player == 0xFFFF) {
        return -0x8000;
    }
    if (D_8006B9D8 == 0) {
        return D_80080CFC[team].stats[index][stat];
    }
    if ((u16)(stat - 33) < 6) {
        return frame_resource_finalize(player, stat);
    }
    return func_80023F94(player, stat);
}
