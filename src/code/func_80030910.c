#include "types.h"

typedef struct {
    u16 buttons;
    u8 pad[4];
} Pad30910;

void func_80030EF4(s16, u8 *, u8 *);
s32 func_80031C20(u16, s8);
extern s32 D_80086180;
extern s16 D_80086DA8;
extern s8 D_80086DE4[];
extern s32 D_80087100[];
extern u8 D_800880E8[];
extern s32 D_80088620;
extern Pad30910 D_8008B3B0[];

void func_80030910(void) {
    u8 v[2];
    s32 i;
    u16 bits;

    if (D_80088620 != D_80086180) {
        for (i = 0; i < D_80086DA8; i++) {
            bits = D_8008B3B0[D_80086DE4[i]].buttons;
            if (D_800880E8[i] != 0) {
                func_80030EF4(i, &v[0], &v[1]);
                if (v[0] < 0xA) {
                    bits |= 0x200;
                }
                if (v[0] >= 0x16) {
                    bits |= 0x100;
                }
                if (v[1] < 0xA) {
                    bits |= 0x800;
                }
                if (v[1] >= 0x16) {
                    bits |= 0x400;
                }
            }
            D_80087100[i] = func_80031C20(bits & 0xFF3F, i);
        }
        D_80086180 = D_80088620;
    }
}
