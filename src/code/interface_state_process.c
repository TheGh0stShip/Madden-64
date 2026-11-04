#include "types.h"

extern s32 D_800740E8;
extern u16 D_8008A5B4;
extern s32 D_80088078;
extern u16 D_80089320;
extern s16 D_80088AE4;
extern s32 D_80080C10;
extern s32 D_80084F34;
extern u16 D_80084EE0;
extern u16 D_80082D94;
extern u16 func_80031A1C(s32 range);
extern s16 func_8003CBB8(void);
extern void func_8003CE88(s32 arg0, s16 arg1, s16 arg2);
extern void func_80041850(s32 mode);
extern void func_800418F8(void);

void interface_state_process(void) {
    u16 pick;
    s32 y;
    s16 random;
    s32 range;
    s32 diff;

    D_800740E8 -= D_8008A5B4;
    if (D_800740E8 <= 0) {
        do {
            pick = func_80031A1C(10);
        } while (D_80088078 == pick);
        range = 0x1F;
        y = (s16)(func_8003CBB8() * 10 + 0x2D);
        random = func_80031A1C(range);
        func_8003CE88(pick + 0x33, y, random);
        D_80088078 = pick;
        D_800740E8 = func_80031A1C(0x78) + 0x258;
    }
    if ((u16)(D_80089320 + 1) >= 2 && D_80088AE4 != 0 && !(D_80080C10 & 1)) {
        if ((s16)D_80089320 == 3) {
            goto crowd;
        }
        if ((D_80084F34 >> 20) >= 0x1A) {
            diff = __builtin_abs(D_80084EE0 - D_80082D94);
            if (diff < 7) {
crowd:
                func_80041850(2);
                return;
            }
        }
    }
    func_800418F8();
}
