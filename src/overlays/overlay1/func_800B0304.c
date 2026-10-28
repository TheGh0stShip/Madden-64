#include "types.h"

extern s16 D_8006B9BC;
extern s32 D_8006B9CC;
extern u8 D_8006BFF8[];
extern u8 D_8006DF90[];
extern u8 D_8006DF98[];
extern s16 D_800876DC;
extern u8 D_80089588[];

void func_8002E65C(u8 *, u8 *);
s32 func_8004DF94(u8 *);
s16 func_800AACE8(s32, s32 *, s32);
void func_800AB2D0(u8 *, s16);

void func_800B0304(void) {
    if (D_8006B9BC == -1) {
        if (D_800876DC < 5) {
            func_800AB2D0(D_80089588, D_800876DC);
            func_8002E65C(D_80089588 + func_8004DF94(D_80089588), D_8006DF90);
        } else if (D_800876DC == 5) {
            func_8002E65C(D_80089588, D_8006DF98);
        } else {
            func_8002E65C(D_80089588, D_8006BFF8);
        }
        D_8006B9BC = func_800AACE8(0xE8, &D_8006B9CC, 4);
    }
}
