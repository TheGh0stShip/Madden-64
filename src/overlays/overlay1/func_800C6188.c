#include "types.h"

typedef struct RosterStatus {
    u8 injury;
    u8 morale;
    u8 unk02;
} RosterStatus;

typedef struct RosterTeam {
    u16 slot[55];
    u8 players[55][0x28];
    RosterStatus status[55];
    u8 pad9AB[0xB64 - 0x9AB];
    u16 depth[(0x214C - 0xB64) / 2];
} RosterTeam;

typedef struct Player {
    u8 pad00[0x1E];
    u8 team;
    u8 index;
} Player;

extern RosterTeam D_80080CFC[];
extern u8 D_80073520[][16];
extern s16 D_80087A68;
extern s16 D_80087A92;

u16 func_80031A1C(s32 chance, Player *player);

void func_800C6188(Player *player)
{
    s16 chance;
    u8 team;
    u16 slot;

    if (!(D_80073520[D_80087A92][3] & 2)) {
        switch (D_80087A68) {
            case 3:
                chance = 3;
                break;
            case 1:
                chance = 1;
                break;
            default:
                chance = 7;
                break;
        }
        team = player->team;
        slot = D_80080CFC[team].depth[player->index];
        if (func_80031A1C(chance, player) == 0) {
            if (D_80080CFC[team].status[slot].morale < 0xFF) {
                D_80080CFC[team].status[slot].morale += 10;
            }
        }
    }
}
