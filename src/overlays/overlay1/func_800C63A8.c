#include "types.h"

typedef struct {
    u8 injury;
    u8 unk1;
    u8 count;
} PlayerStatus;

typedef struct {
    u16 slot[55];
    u8 players[55][0x28];
    PlayerStatus status[55];
    u8 pad9AB[0xB64 - 0x9AB];
    s16 depth[11];
    u8 padB7A[0x214C - 0xB7A];
} Team;

typedef struct {
    u8 pad00[0x6C];
    Team teams[2];
} League;

typedef struct {
    u8 pad00[0x28];
    u16 flags;
    u16 time;
} Member;

typedef struct {
    Member *members[22];
} Group;

extern League D_80080C90;
extern Group D_80085040[2];
extern u8 D_80085D40;

void func_800C2190(s32, s32, u16);
void func_800C2210(s32, s32, s32);

void func_800C63A8(void) {
    s32 team;
    s32 slot;
    s32 k;
    s32 found;

    if (D_80085D40 == 1) {
        for (team = 0; team < 2; team++) {
            for (slot = 0; slot < 55; slot++) {
                found = 0;
                for (k = 0; k < 11; k++) {
                    if (D_80080C90.teams[team].depth[k] == slot) {
                        found = 1;
                        if (!(D_80085040[team].members[k]->flags & 4)) {
                            func_800C2210(team, slot, 1);
                        }
                        func_800C2190(team, slot, D_80085040[team].members[k]->time / 60);
                        if (++D_80080C90.teams[team].status[slot].count >= 8) {
                            D_80080C90.teams[team].status[slot].count = 0;
                            func_800C2190(team, slot, 1);
                        }
                        k = 11;
                    }
                }
                if (!found) {
                    func_800C2210(team, slot, 2);
                    D_80080C90.teams[team].status[slot].count = 0;
                }
            }
        }
    }
    D_80085D40 = 0;
}
