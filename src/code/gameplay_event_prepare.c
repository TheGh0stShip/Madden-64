#include "types.h"

typedef struct GameEvent {
    u8 slot;
    u8 type;
    s16 value;
} GameEvent;

typedef struct TeamData {
    u16 players[11];
    u16 stats[45][47];
    u8 pad[0x1448 - 0x16 - 45 * 0x5E];
    s16 event_count;
    GameEvent events[30];
    u8 pad2[0x214C - 0x144A - 30 * 4];
} TeamData;

typedef struct PlayerInfo {
    u8 pad[0x21];
    u8 rating;
} PlayerInfo;

extern TeamData D_80081860[2];
extern PlayerInfo *D_80085040[2][22];
extern u16 D_80085A18;
extern s16 D_80082D22[];
extern void func_80025F44(u16 team, u8 type, u16 player, s16 value);
extern void func_80028CA8(s32 kind, s16 value, u16 team, u16 player, u16 rating);
extern void func_80025AB8(void);

void gameplay_event_prepare(void)
{
    s16 team;
    s16 i;

    for (team = 0; team < 2; team++) {
        for (i = 0; i < D_80081860[team].event_count; i++) {
            u16 player;
            u8 type;

            if (D_80081860[team].events[i].type == 0xFF) {
                continue;
            }
            player = D_80081860[team].players[D_80081860[team].events[i].slot];
            func_80025F44(team, D_80081860[team].events[i].type, player,
                          D_80081860[team].events[i].value);
            type = D_80081860[team].events[i].type;
            if (type < 40) {
                D_80081860[team].stats[player][type] += D_80081860[team].events[i].value;
            } else if ((s16)D_80081860[team].stats[player][type] < D_80081860[team].events[i].value) {
                D_80081860[team].stats[player][type] = D_80081860[team].events[i].value;
            }
            switch (D_80081860[team].events[i].type) {
            case 34:
                func_80028CA8(5, D_80081860[team].events[i].value, team, player,
                              D_80085040[team][D_80081860[team].events[i].slot]->rating);
                break;
            case 30:
                func_80028CA8(3, D_80081860[team].events[i].value, team, player,
                              D_80085040[team][D_80081860[team].events[i].slot]->rating);
                break;
            case 37:
                func_80028CA8(4, D_80081860[team].events[i].value, team, player,
                              D_80085040[team][D_80081860[team].events[i].slot]->rating);
                break;
            case 10:
                func_80028CA8(1, D_80081860[team].events[i].value, team, player,
                              D_80085040[team][D_80081860[team].events[i].slot]->rating);
                break;
            case 5:
                func_80028CA8(0, D_80081860[team].events[i].value, team, player, D_80085A18);
                break;
            case 40:
                func_80028CA8(2, D_80081860[team].events[i].value, team, player,
                              D_80085040[team][D_80081860[team].events[i].slot]->rating);
                break;
            }
        }
    }
    for (i = 0; i < 23; i++) {
        D_80082D22[i] += D_80082D22[i + 23];
        D_80082D22[i + 0x10A6] += D_80082D22[i + 0x10A6 + 23];
    }
    func_80025AB8();
}
