#include "types.h"

typedef struct {
    u8 position;
    u8 unk01[0x27];
} RosterPosition;

typedef struct {
    RosterPosition entry[55];
    u8 unk898[0x214C - 0x898];
} RosterPositionBlock;

typedef struct {
    u8 injury;
    u8 unk01[2];
} RosterStatus;

typedef struct {
    RosterStatus entry[55];
    u8 unkA5[0x214C - 0xA5];
} RosterStatusBlock;

typedef struct {
    u8 slot[18][11];
    u8 unkC6[0x214C - 0xC6];
} RosterDepthBlock;

typedef struct {
    s16 formation;
    u8 unk02[0x214A];
} RosterFormationBlock;

typedef struct {
    u8 unk00;
    u8 unk01[0x27];
} FormationInfo;

typedef struct {
    u8 position;
    u8 unk01;
} FormationSlot;

extern RosterPositionBlock D_80080D78[];
extern RosterStatusBlock D_80081602[];
extern RosterDepthBlock D_800816A7[];
extern RosterFormationBlock D_80082DC0[];
extern FormationInfo D_80072DF6[];
extern FormationSlot D_8006AAD8[][11];

s32 func_80022C44(s32 index);
s32 gameplay_roster_update(u16 team, u16 arg1, u16 arg2);
void func_8002212C(u16 team, u16 player, u16 formation, u16 slot);

void gameplay_state_process(s16 team) {
    s32 formation;
    s32 i;
    s32 swap;
    s32 player;
    s32 current;
    s32 pos;

    if ((s8)func_80022C44(team) == 1) {
        formation = D_80082DC0[team].formation;
        if (formation == 5) {
            D_800816A7[team].slot[5][5] = 0xFF;
            func_8002212C(team, gameplay_roster_update(team, 5, 5), 5, 5);
        }
        for (i = 0; i < 11; i++) {
            swap = 0;
            player = (u16)gameplay_roster_update(team, formation, i);
            current = D_800816A7[team].slot[formation][i];
            pos = D_8006AAD8[D_80072DF6[formation].unk00][i].position;
            if ((D_80080D78[team].entry[player].position & 0x3F) == (D_80080D78[team].entry[current].position & 0x3F)) {
                if (player < current) {
                    swap = 1;
                } else if (D_80081602[team].entry[current].injury >= 41) {
                    swap = 1;
                }
            } else if ((D_80080D78[team].entry[player].position & 0x3F) == pos) {
                swap = 1;
            }
            if (pos >= 23) {
                swap = 0;
            }
            if (swap) {
                func_8002212C(team, player, formation, i);
            }
        }
    }
}
