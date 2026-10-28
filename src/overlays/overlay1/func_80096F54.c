#include "types.h"

extern s32 D_80080C10;
extern s32 D_80080C1C;
extern s8 D_80085026;
extern s16 D_800857CA;
extern s16 D_800869D6;
extern s8 D_80086DDC[];
extern u16 D_80087758;
extern s32 D_80088714;
extern s16 D_80088AE4;
extern s16 D_80089320;

void func_80038150(u16);
void func_8003890C(void);
void func_80041718(s32);
void func_800A365C(s32);
void func_800D62A8(void);
void func_800E1EF8(s16);

void func_80096F54(s16 team) {
    s16 *timer;
    s32 flags;

    if (team == D_80088AE4) {
        D_80088714 = 0;
        flags = D_80080C10 | 0x800;
        D_80080C10 = flags & 0xFFFF7E36;
        if (flags & 2) {
            D_80085026 = 1;
        }
        D_800869D6 = D_80087758 - 3;
    }
    timer = &D_800857CA;
    if (*timer > 0) {
        *timer = 0;
    }
    if (D_80089320 != -1) {
        if (team == D_80088AE4) {
            func_80041718(0xC);
        } else if (D_80085026 == 0) {
            func_80041718(0);
        }
    }
    D_80080C1C = 0;
    func_8003890C();
    if (D_80086DDC[team] == 1) {
        func_80038150(team);
        func_800E1EF8(team);
        func_800D62A8();
    }
    if (!(D_80080C10 & 0x100)) {
        func_800A365C(0);
    }
}
