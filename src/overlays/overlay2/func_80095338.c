#include "types.h"

typedef struct {
    u8 pad0[0x2072];
    u8 id;
    u8 pad2073[0x214C - 0x2073];
} Team;

extern Team D_80080D6A[2];
extern s8 D_800C3968;
u16 func_8003B3A0(Team *, s32);

u8 func_80095338(s32 id) {
    s32 value = id == D_80080D6A[0].id;

    value = func_8003B3A0(&D_80080D6A[value], value);
    if (value < 65) {
        return D_800C3968;
    }
    if (value < 75) {
        return D_800C3968 / 2;
    }
    return 0;
}
