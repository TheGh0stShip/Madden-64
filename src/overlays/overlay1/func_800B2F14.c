#include "types.h"

typedef struct {
    u8 *obj;
    s32 unk04;
} ObjectSlot;

extern ObjectSlot D_80086DEC[];
extern u16 D_80088AE4;
extern s16 D_80089348[];

s16 func_800AACE8(s32, s32, s32);

void func_800B2F14(u16 team) {
    s16 id;

    id = func_800AACE8(0x70, 0, 5);
    D_80089348[team] = id;
    if (team == D_80088AE4) {
        *(s32 *)(D_80086DEC[id].obj + 0x20) = 0x1E;
    } else {
        *(s32 *)(D_80086DEC[id].obj + 0x20) = -0x1E;
    }
}
