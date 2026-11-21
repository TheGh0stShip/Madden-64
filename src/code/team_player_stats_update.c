#include "types.h"

typedef struct {
    u8 id;
    u8 pad01[0x214B];
} TeamInfo;

typedef struct {
    u16 slot[55];
    u8 rest[0x214C - 110];
} RosterTeam;

extern TeamInfo D_80080C90[];
extern RosterTeam D_80080CFC[];
extern u8 D_8000105C[];
extern u8 D_80001400[];

u8 *func_80037108(void *resource, s32 mode);
s32 frame_identifier_find(u32 identifier);
s16 packed_field_dispatch(void *record, u32 index_arg);

s16 team_player_stats_update(u16 team, u16 slot, u16 stat) {
    u8 *table;
    u8 *base;

    if (D_80080CFC[team].slot[slot] == 0xFFFF) {
        return -0x8000;
    }
    table = func_80037108(D_8000105C, 1);
    if ((u16)(stat - 0x21) < 6) {
        return 0;
    }
    if (stat != 0) {
        return packed_field_dispatch(table + (u16)(slot + (u16)frame_identifier_find(D_80080C90[team].id) * 55) * 12, stat);
    }
    base = func_80037108(D_80001400, 1) + (u16)frame_identifier_find(team) * 14;
    return (s8)base[0x7FE] + (s8)base[0x7FF];
}
