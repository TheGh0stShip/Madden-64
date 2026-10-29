#include "types.h"

typedef struct { u8 pad0[0x2C]; u8 unk2C[8]; s32 unk34; } S6178;
extern s32 func_80031A1C(s32);
extern void func_800B9274(s16, void *, s32);
extern s16 func_800C157C(s32);
extern u16 D_80080C14;
extern S6178 *D_80086178;
extern s16 D_80086E28;
extern s16 D_80086E2A;
extern s16 D_80086E2C;
extern s32 D_80087A70;

void func_800C8C08(s32 arg0) {
    s32 v;
    D_80086178->unk34 = ((u16)func_80031A1C(0x18) + 0x20) << 9;
    D_80080C14 = (D_80080C14 & 0xFFFA) | 2;
    D_80086E28 = func_80031A1C(0x111) - 0x88;
    D_80086E2A = func_80031A1C(0x111) - 0x88;
    D_80086E2C = func_80031A1C(0x111) - 0x88;
    if (arg0 != 0) {
        s16 t = func_800C157C(arg0);
        v = t + (u16)func_80031A1C(0x238) - 0x11C;
    } else {
        v = (u16)func_80031A1C(0xFFF);
    }
    func_800B9274(v, D_80086178->unk2C, ((u16)func_80031A1C(0x10) + 8) << 12);
    D_80087A70 = 0x7FFFFFFF;
}
