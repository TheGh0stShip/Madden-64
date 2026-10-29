#include "types.h"

void func_800D52D4(void);
extern s8 D_800808C4;
extern s32 D_80080C10;
extern s32 D_80084F30;
extern s16 D_80085BFC;
extern s8 D_800869CC;
extern s8 D_80085A48[];
extern s8 D_8008B320[];
extern s8 D_8008B310[];

void func_800D6ABC(void) {
    s32 i;

    for (i = 0; i < 11; i++) {
        D_80085A48[i] = 0;
        D_8008B310[i] = D_8008B320[i] = i;
    }
    if (D_80080C10 & 0x100) {
        D_800869CC = 1;
    } else {
        D_800869CC = 0;
    }
    if (D_80084F30 > 0) {
        D_800808C4 = 0;
    } else {
        D_800808C4 = 10;
    }
    D_80085BFC = 0;
    func_800D52D4();
}
