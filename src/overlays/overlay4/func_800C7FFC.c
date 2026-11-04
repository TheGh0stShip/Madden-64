#include "types.h"

typedef struct {
    u8 pad0[0x12];
    s16 unk12;
} S8;

typedef struct {
    u8 pad0[8];
    S8 *unk8;
    u8 padC[8];
    s32 unk14;
    u8 pad18[4];
    s32 unk1C;
    s32 unk20;
} SObj;

extern SObj *D_80086178;
extern u16 D_800876E2;
extern SObj *D_80087B54;

void func_800C7FFC(void) {
    if (D_80086178->unk14 & 1) {
        do {
            D_80087B54->unk14 |= 1;
            D_80087B54->unk1C = D_80086178->unk1C;
            D_80087B54->unk20 = D_80086178->unk20;
        } while (0);
        {
            u16 value = D_800876E2;
            D_80087B54->unk8->unk12 = value + 0x400;
        }
    } else {
        D_80087B54->unk14 &= ~1;
    }
}
