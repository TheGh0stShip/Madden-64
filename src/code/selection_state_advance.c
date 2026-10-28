#include "types.h"

extern u16 D_80087A60;
extern s16 D_800876DC;
extern u16 D_80087AAC;
extern s16 D_80089320;
extern u16 D_80084F34;
extern u8 D_80088AE8;
extern s16 D_80088AEC;
extern s16 D_80088AF0;

void func_80029494(void) {
    D_80088AF0 = D_80087A60 - D_80087AAC +
                  (s16)D_80087A60 * (D_800876DC - 1);
    if (D_80089320 != 0) {
        register s32 value;
        value = *(s16*)&D_80084F34;
        D_80088AEC = value;
    }
    D_80088AE8++;
}
