#include "types.h"

typedef struct {
    u8 pad0[0x2072];
    u8 id;
    u8 pad2073[0x214C - 0x2073];
} Team;

extern Team D_80080D6A[2];
extern u8 D_800C3968;
s32 func_8003B02C(Team *);
s32 func_8003B3A0(Team *);

u8 func_80095A10(s32 id) {
    s32 home = id == D_80080D6A[0].id;
    Team *team = &D_80080D6A[home];
    s32 first = (u16)func_8003B02C(team);

    s32 second = (u16)func_8003B3A0(team);

    if ((second >= 81) && (first >= 81)) {
        return D_800C3968;
    }
    return 0;
}
