#include "types.h"

typedef struct {
    u8 pad00[0x21];
    u8 slot;
} Actor;

extern s16 D_80069BEC[];
extern u16 D_80086D48;
extern s32 D_80086CFC;
extern s32 D_800878A8[];

s32 func_8000C8EC(s32);

s16 func_800C0188(Actor *actor) {
    s16 angle;
    s16 sum;

    angle = D_80069BEC[(D_800878A8[actor->slot & 0xBF] & 0xF00) >> 8];
    if (angle != -1) {
        angle = sum = angle + D_80086D48;
        if (func_8000C8EC(D_80086CFC) != 0) {
            angle = sum - 0x7FF;
        }
        angle &= 0xFFF;
    }
    return angle;
}
