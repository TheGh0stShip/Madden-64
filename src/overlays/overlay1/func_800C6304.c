#include "types.h"

typedef struct {
    u8 pad00[0x28];
    u16 flags;
    s16 unk2A;
} Player;

extern Player *D_80085040[2][22];
extern s8 D_80085D40;
extern s16 D_80087758;

void func_800C1E4C(s32);

void func_800C6304(void) {
    s32 i;
    s32 j;

    for (i = 0; i < 2; i++) {
        for (j = 0; j < 11; j++) {
            D_80085040[i][j]->flags &= 0xFFFB;
            D_80085040[i][j]->unk2A = 0;
        }
    }
    func_800C1E4C((0x28 - D_80087758) / 15);
    D_80085D40 = 1;
}
