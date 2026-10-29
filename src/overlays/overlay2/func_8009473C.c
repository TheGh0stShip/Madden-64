#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_80032E00(s32, s32);                /* extern */
s32 func_80032F3C(s32, s32);                /* extern */
s32 func_800E2068(s32 *, s32, s32);     /* extern */
s32 func_800E2190(s32 *, s32, s32);     /* extern */
extern s32 D_800019FC;
extern s32 D_80001A04;

void func_8009473C(void) {
    s32 temp_v0;
    s32 temp_v0_2;

    temp_v0 = func_80032E00(0, 0x1456);
    func_800E2068(&D_800019FC, temp_v0, 0);
    func_800E2190(&D_800019FC, temp_v0, 1);
    func_80032F3C(0, temp_v0);
    temp_v0_2 = func_80032E00(0, 0x3C0);
    func_800E2068(&D_80001A04, temp_v0_2, 0);
    func_800E2190(&D_80001A04, temp_v0_2, 1);
    func_80032F3C(0, temp_v0_2);
}
