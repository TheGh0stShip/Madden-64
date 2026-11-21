#include "types.h"

extern s16 D_80089320;
extern u16 D_8008A5B4;
extern u16 D_8007A0B8[];
extern u16 D_8007A154[];
extern u16 *D_8007A13C[];
extern u16 D_8007A128[];
extern u16 *D_8007A120[];
extern u16 *D_8006B634[];
void func_800A9330(u16 a, u16 b);
u16 func_80031A1C(u16 n);
void func_800A84E0(u16 a, u16 b);

void func_800A9004(s32 arg0) {
    u16 *p;
    u16 r;

    if (D_80089320 != -1) {
        D_8007A0B8[(u16)arg0] -= D_8008A5B4;
        if ((s16)D_8007A0B8[(u16)arg0] < 0) {
            if (D_8007A154[(u16)arg0] != 2) {
                D_8007A154[(u16)arg0] = 2;
                func_800A9330(arg0, 2);
            }
            D_8007A0B8[(u16)arg0] = func_80031A1C(0x20) + 7;
        retry:
            p = D_8007A13C[(u16)arg0];
            r = func_80031A1C(p[0] * 3) + 1;
            D_8007A128[(u16)arg0] = p[r];
            p = D_8006B634[p[r]];
            if (D_8007A120[(u16)arg0] == p) {
                goto retry;
            }
            D_8007A120[(u16)arg0] = p;
            func_800A84E0(func_80031A1C(p[0] - 2), arg0);
        }
    }
}
