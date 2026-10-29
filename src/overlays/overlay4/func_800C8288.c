#include "types.h"

typedef struct { u8 pad0[0x2C]; u8 unk2C[8]; } S6178;
extern s32 func_80031A1C(s32);
extern void func_800B9274(s16, void *, s32);
extern u16 D_80080C14;
extern S6178 *D_80086178;
extern s16 D_80086E28;
extern s16 D_80086E2A;
extern s16 D_80086E2C;

void func_800C8288(void) {
    s32 temp_s0;
    D_80080C14 = (D_80080C14 & 0xFFFA) | 2;
    D_80086E28 = func_80031A1C(0x111) - 0x88;
    D_80086E2A = func_80031A1C(0x111) - 0x88;
    D_80086E2C = func_80031A1C(0x111) - 0x88;
    temp_s0 = (s16)func_80031A1C(0xFFF);
    func_800B9274(temp_s0, D_80086178->unk2C, ((u16)func_80031A1C(0x10) + 8) << 12);
}
