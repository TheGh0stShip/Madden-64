#include "types.h"

typedef struct {
    u8 pad0000[0x20D0];
    s32 playbook;
    u8 pad20D4[0x214C - 0x20D4];
} Team;

typedef struct {
    s32 unk00;
    s32 unk04;
    s32 playbook;
    s32 seed;
    s32 state;
    s32 unk14;
    s32 unk18;
    s32 unk1C;
} PlayJob;

extern PlayJob D_8006B968;
extern s32 D_8006B9D4;
extern Team D_80080CFC[];
extern u16 D_80088472;

void func_8001AEA8(PlayJob *);
u16 func_80031A1C(s32);
void func_800363F4(u16, s32, s32);
s16 func_800AACE8(s16, s32, s32);
s32 func_800AE680(void);

s16 func_800B371C(s16 arg0, s16 team, s32 arg2, s32 seed) {
    s32 *state = &D_8006B968.state;

    *state = 0;
    if (seed == 0) {
        func_800363F4(D_80088472, func_80031A1C(5) + 2, D_8006B9D4);
        seed = func_800AE680();
    }
    D_8006B968.playbook = D_80080CFC[team].playbook;
    D_8006B968.seed = seed;
    D_8006B968.unk1C = 0;
    D_8006B968.unk18 = 0;
    D_8006B968.unk14 = 0;
    *state = 0;
    func_8001AEA8((PlayJob *)(state - 4));
    return func_800AACE8(arg0, arg2, 3);
}
