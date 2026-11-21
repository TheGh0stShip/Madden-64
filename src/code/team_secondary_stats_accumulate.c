#include "types.h"

extern u8 D_80080C90[];
extern u16 D_8006B9D8;
typedef struct {
    u8 pad0[0x5358];
    u16 unk_5358[1][31];
} StatBlock;

extern StatBlock *D_8006B9DC;
extern u16 frame_identifier_find(u32 identifier);
extern s32 roster_stat_process(u16 team, u16 index);

void team_secondary_stats_accumulate(s32 team) {
    u16 saved;
    u16 *stats;
    u16 slot;
    s16 i;

    slot = frame_identifier_find(D_80080C90[(u16)team * 8524]);
    saved = D_8006B9D8;
    D_8006B9D8 = 0;
    stats = D_8006B9DC->unk_5358[slot];
    for (i = 0; i < 31; i++) {
        stats[i] += roster_stat_process(team, i);
    }
    D_8006B9D8 = saved;
}
