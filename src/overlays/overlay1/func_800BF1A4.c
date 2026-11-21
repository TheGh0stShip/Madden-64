#include "types.h"

extern s32 D_80089490[];
extern s32 D_800878A8[];
s32 func_80030B54(s16);
s32 func_80030E84(s16);
void func_80030EF4(s16, u8 *, u8 *);

void func_800BAA80(void) {
    s16 i;
    s32 flags;
    u8 a;
    u8 b;

    for (i = 0; D_80089490[i] != -1; i++) {
        flags = func_80030B54(D_80089490[i]);
        if (func_80030E84(D_80089490[i]) == 1) {
            func_80030EF4(D_80089490[i], &a, &b);
            if (a != 16 || b != 16) {
                flags &= ~0xF00;
                if (a != 16) {
                    if (a > 16) {
                        flags |= 0x100;
                    } else {
                        flags |= 0x200;
                    }
                }
                if (b != 16) {
                    if (b > 16) {
                        flags |= 0x800;
                    } else {
                        flags |= 0x400;
                    }
                }
            }
        }
        D_800878A8[D_80089490[i]] = flags;
    }
}
