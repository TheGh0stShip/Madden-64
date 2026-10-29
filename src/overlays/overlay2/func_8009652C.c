#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_800325C0(s8, s8, s8, s8);              /* extern */
s32 func_8003CB2C(u8);                          /* extern */
s32 func_8003FD70(u8, u8);                      /* extern */
s32 func_8003FD84(u8);                      /* extern */
s32 func_800B3558(s32, u8, s32, s32); /* extern */
s32 func_800B3700(s32, u8, s32, s32); /* extern */
extern s16 D_80073D68;
extern s16 D_80073D6A;
extern u16 D_80087962;
extern u8 D_80087967;
extern u8 D_8008796B;
extern u8 D_8008796C;
extern u8 D_8008796D;
extern u8 D_8008796E;
extern u8 D_8008796F;
extern s8 D_80087970;
extern s8 D_80087971;
extern s8 D_80087972;
extern s8 D_80087973;
extern u16 D_80087A60;

void func_8009652C(void) {
    D_80087A60 = D_80087962;
    D_80073D68 = (s16) D_8008796B;
    D_80073D6A = (s16) D_8008796C;
    if (D_80087967 != 0) {
        func_8003FD70(D_8008796C, D_80087967);
    } else {
        func_8003FD84(D_8008796C);
    }
    func_800B3700(2, D_8008796D, 0, 0);
    func_800B3558(2, D_8008796E, 0, 0);
    func_8003CB2C(D_8008796F);
    func_800325C0(D_80087970, D_80087971, D_80087972, D_80087973);
}
