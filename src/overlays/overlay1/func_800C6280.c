#include "types.h"

typedef struct {
    u8 pad00[0xB64];
    s16 ratings[(0x214C - 0xB64) / 2];
} RosterTeam;

typedef struct {
    u8 pad00[0x1C];
    u8 position;
    u8 pad1D;
    u8 team;
    u8 index;
    u8 pad20[8];
    u16 flags;
} Player;

extern RosterTeam D_80080CFC[];
extern u8 D_8007480C[];

void func_800C2190(s32, s16, s32, s32);

void func_800C6280(Player *player) {
    s32 position;
    s32 team;

    player->flags |= 4;
    position = player->position & 0x3F;
    team = player->team;
    func_800C2190(team, D_80080CFC[team].ratings[player->index], D_8007480C[position], team);
}
