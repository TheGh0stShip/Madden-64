#include "types.h"

typedef struct {
    u16 slot[55];
    u8 rest[0x214C - 110];
} RosterTeam;

extern RosterTeam D_80080CFC[];

u16 func_800AF1D4(u16 team) {
    u16 n;

    for (n = 0; D_80080CFC[team].slot[n] != 0xFFFF; n++) {
    }
    return n;
}
