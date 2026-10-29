#include "types.h"

typedef struct {
    u8 pad[3];
    u8 flags;
} Ctl30620;

void func_8003190C(s32, s32);
extern Ctl30620 D_80085180[];
extern s32 D_80086180;
extern s8 D_80086C65;
extern s16 D_80086DA8;
extern s8 D_80086DE4[];
extern s16 D_800880A8;
extern s8 D_800880E8[];
extern s32 D_80088620;
extern s16 D_8008B2A0[];
extern s16 D_8008B388[];
extern s16 D_8008B630[];
extern s16 D_8008B648[];

s16 func_80030620(void) {
    s32 i;
    s32 one;

    i = 0;
    one = 1;
    D_80086DA8 = 0;
    D_80086180 = D_80088620 - 1;
    for (; i < 4; i++) {
        if (!(D_80085180[i].flags & 8)) {
            D_80086DE4[D_80086DA8] = i;
            D_800880E8[D_80086DA8] = one;
            D_80086DA8++;
        }
    }
    if (D_80086C65 == 0) {
        func_8003190C(0, one);
    }
    for (i = 0; i < 4; i++) {
        D_8008B388[i] = 0;
        D_8008B648[i] = 0;
        D_8008B630[i] = 0;
        D_8008B2A0[i] = 0;
    }
    D_800880A8 = 0x10;
    return D_80086DA8;
}
