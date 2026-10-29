#include "types.h"

typedef struct { u8 pad0[0x24]; s32 unk24; u8 pad28[0xC]; s32 unk34; } S6178;
extern void func_8003CF78(s32, s32);
extern void func_8004192C(s32);
extern void func_8009CCD4(void);
extern void func_800A365C(s32);
extern void func_800C77F0(void);
extern u32 D_80080C10;
extern S6178 *D_80086178;
extern s16 D_80086CB2;
extern s16 D_800878D2;
extern u8 D_80087964;
extern s32 D_80087A70;
extern s16 D_80088AE4;
extern s16 D_800893A0;
extern s16 D_8008A5B2;
extern s16 D_8008B072;

void func_800C9B90(void) {
    if (D_80086178->unk24 <= 0) {
        func_8003CF78(0x16, 0xA);
        if (D_80080C10 & 0x400000) {
            D_80087A70 = 0x7FFFFFFF;
            func_800C77F0();
        } else {
            func_8009CCD4();
            D_80087A70 = 0x7FFFFFFF;
            D_8008A5B2 = 0;
        }
    }
    if (D_800878D2 >= D_80086CB2 / 8 && D_800893A0 == 0 && D_80088AE4 == 0) {
        func_8004192C(0);
        D_800893A0 = -1;
    }
    if (D_80086178->unk34 <= 0 && D_8008B072 >= -1 && D_80087964 != 3 && D_80087964 != 4) {
        func_800A365C(4);
    }
}
