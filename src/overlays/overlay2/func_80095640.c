#include "types.h"

typedef struct {
    u8 data[0x214C];
} Team;

extern Team D_80080D6A[];
extern u8 D_800C3988;
s32 func_8003B02C(Team *);
s32 func_8003B3A0(Team *);

u8 func_80095640(void) {
    s32 ok;
    s32 i;
    Team *team;

    ok = 1;
    for (i = 0, team = D_80080D6A; i < 2; i++, team++) {
        s32 first = (u16)func_8003B02C(team);
        ok &= -(first + (u16)func_8003B3A0(team) >= 0xA0);
    }
    if (ok == 1) {
        return D_800C3988;
    }
    return 0;
}
