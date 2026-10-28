#include "types.h"

extern u16 D_8006B7A8;
extern s32 D_80080C10;
extern s16 D_80085280;
extern s16 D_800857B2;
extern s16 D_800876DC;
extern s32 D_80089490[];
extern s16 D_80089598[];

s32 func_80030B54(s16);
void func_8009EB14(s16);
u16 func_8009EC0C(s16);

void func_800915C8(u16 team) {
    s16 i;
    s32 id;
    s16 found;

    found = 0;
    for (i = 0; i < 4; i++) {
        id = D_80089490[i];
        if (id == -1) {
            break;
        }
        if (D_80089598[id] == team) {
            if ((func_80030B54(id) & 0x30) == 0x30) {
                found = 1;
                break;
            }
            if ((func_80030B54(D_80089490[i]) & 0x2010) == 0x2010) {
                found = 1;
                break;
            }
        }
    }
    if (found == 1 &&
        (team != (s16)(D_800857B2 & ~0xC0) || team != (s16)(D_80085280 & ~0xC0) || D_800857B2 != 0 || D_80085280 != 0) &&
        (D_8006B7A8 == 0 || D_8006B7A8 == 2) && D_800876DC != 7 && func_8009EC0C(team) != 0 &&
        !(D_80080C10 & 0x10000)) {
        func_8009EB14(team);
    }
}
