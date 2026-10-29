#include "types.h"

typedef struct {
    u8 pad0[0x2072];
    u8 id;
    u8 pad2073[0x214C - 0x2073];
} Team;

extern Team D_80080D6A[2];
extern s8 D_800C3960;
u16 func_8003B02C(Team *, s32);

u8 func_80095294(s32 id) {
    s32 value = id == D_80080D6A[0].id;

    value = func_8003B02C(&D_80080D6A[value], value);
    if (value < 65) {
        return D_800C3960;
    }
    if (value < 75) {
        return D_800C3960 / 2;
    }
    return 0;
}
