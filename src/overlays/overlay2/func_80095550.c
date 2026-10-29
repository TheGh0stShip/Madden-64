#include "types.h"

typedef struct {
    s8 scored;
    s8 allowed;
    u8 rest[12];
} Entry14;

typedef struct {
    u8 pad[0x12];
    s16 total;
    u8 rest[0x3E - 0x14];
} TeamStat;

extern Entry14 D_800C5896[];
extern s8 D_800C509C;
extern u8 D_800C3980;
extern s32 D_80001A68;
u16 func_80028A58(u16);
u8 *func_80037108(s32 *, s32);

u8 func_80095550(u16 team) {
    TeamStat *stat;
    s32 i;

    if (D_800C509C >= 2) {
        stat = (TeamStat *)(func_80037108(&D_80001A68, 1) + 0x5358) + func_80028A58(team);
        i = func_80028A58(team);
        if (stat->total / (D_800C5896[i].scored + D_800C5896[i].allowed) >= 46) {
            return D_800C3980;
        }
    }
    return 0;
}
