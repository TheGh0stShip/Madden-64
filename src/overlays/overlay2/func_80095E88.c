#include "types.h"

typedef struct {
    u16 id;
    u8 unk2;
    u8 flags;
} Captain;

typedef struct {
    u8 pad0[0x201A];
    Captain captains[4];
    u8 pad202A[0x2072 - 0x202A];
    u8 id;
    u8 pad2073[0x214C - 0x2073];
} Team;

extern Team D_80080D6A[2];
extern u8 D_800C39D0;

u8 func_80095E88(s32 id) {
    s32 count = 0;
    s32 i;
    s32 home = id == D_80080D6A[0].id;

    for (i = 0; i < 4; i++) {
        if (D_80080D6A[home].captains[i].id != 0xFFFF) {
            count += D_80080D6A[home].captains[i].flags != 0x80;
        }
    }
    if (count >= 3) {
        return D_800C39D0;
    }
    return 0;
}
