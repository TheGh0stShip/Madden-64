#include "types.h"

typedef struct {
    u8 injury;
    u8 unk01[2];
} RosterStatus;

typedef struct {
    u16 slot[55];
    u8 players[55][0x28];
    RosterStatus status[55];
    u8 pad[0x214C - 0x6E - 55 * 0x28 - 55 * 3];
} RosterTeam;

extern RosterTeam D_80080CFC[];
extern u8 D_80074808;

void func_800C6934(s32 team, s32 index, s32 amount) {
    s32 value;

    if (D_80074808 == 1) {
        value = D_80080CFC[team].status[index].injury - amount;
        if (value < 0) {
            D_80080CFC[team].status[index].injury = 0;
        } else {
            D_80080CFC[team].status[index].injury -= amount;
        }
    }
}
