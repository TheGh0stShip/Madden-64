#include "types.h"

typedef struct { u8 pad0[0x20]; s32 unk20; s32 unk24; u8 pad28[0xC]; s32 unk34; } S6178;
extern void func_8009CA5C(s32, s32);
extern void func_8009E958(void);
extern void func_800C1744(s32 *);
extern u32 D_80080C10;
extern s32 D_80084F34;
extern S6178 *D_80086178;
extern s32 D_80087A70;
extern s16 D_80089320;
extern s16 D_8008A5B2;

void func_800C9CBC(void) {
    if (!(D_80080C10 & 1)) {
        if (D_80089320 != 0) {
            if (D_80084F34 + 0x800000 < D_80086178->unk20 || D_80086178->unk34 < 0 ||
                D_80086178->unk20 >= 0x3200000) {
                func_8009E958();
                D_80080C10 &= ~0x8000;
            }
        } else {
            func_8009CA5C(0x2D, 0xD2);
            D_8008A5B2 = 0;
        }
    }
    if (D_80086178->unk24 <= 0) {
        s32 *q = &D_80087A70;
        if (*q != 0x7FFFFFFF) {
            *q = 0x7FFFFFFF;
            func_800C1744(q);
        }
    }
}
