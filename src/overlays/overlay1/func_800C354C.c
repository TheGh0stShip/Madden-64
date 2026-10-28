#include "types.h"

extern s32 D_80080C10;
extern s16 D_800886E0;
extern s16 D_80088AE4;
extern s32 D_80089490[];
extern s16 D_80089598[];

void func_800C354C(void) {
    s32 *id;

    D_80080C10 &= ~6;
    for (id = D_80089490; *id != -1; id++) {
        if (D_80089598[*id] == D_80088AE4) {
            D_80080C10 |= 2;
            break;
        }
    }
    for (id = D_80089490; *id != -1; id++) {
        if (D_80089598[*id] == D_800886E0) {
            D_80080C10 |= 4;
            break;
        }
    }
}
