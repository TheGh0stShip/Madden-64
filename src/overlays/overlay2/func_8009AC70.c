#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8000D834(s32, s32);                    /* extern */
s32 func_8000D874(s32, s32);                    /* extern */
s32 func_80024E9C();                            /* extern */
s32 func_80032F3C(s32, s32);                /* extern */
s32 func_8003A720(s32, s32);            /* extern */
s32 func_800D57CC();                            /* extern */
s32 func_800D5D28(void *);                      /* extern */
s32 func_800D628C(void *);                      /* extern */
void *func_800DD634();                              /* extern */
extern s32 D_80087AA8;
extern s32 D_8008931C;
extern s32 D_8008B2B0[];
extern s32 D_800C5060;
extern s32 D_800C5064;
extern s32 D_800C5094;

void func_8009AC70(void *arg0) {
    s32 *var_s0;
    s32 temp_a1;
    s32 var_s1;
    void *temp_v0;

    func_8000D874(D_80087AA8, (*(s32 *)((u8 *)(arg0) + 0x3C)));
    func_8000D834(D_8008931C, (*(s32 *)((u8 *)(arg0) + 0x3C)));
    for (var_s1 = 0; var_s1 < 0x17; var_s1++) {
        func_80032F3C(0, D_8008B2B0[var_s1]);
    }
    func_800D5D28(arg0);
    func_800D628C(arg0);
    func_80032F3C(0, D_800C5094);
    func_8003A720(0, 0);
    func_80024E9C();
    func_800D57CC();
    func_80032F3C(0, D_800C5060);
    func_80032F3C(0, D_800C5064);
    temp_v0 = func_800DD634();
    (*(s32 *)((u8 *)(temp_v0) + 0x14)) = 0;
    (*(s32 *)((u8 *)(temp_v0) + 0x18)) = 0;
    (*(s32 *)((u8 *)(temp_v0) + 0x1C)) = 0;
    (*(s32 *)((u8 *)(temp_v0) + 0x20)) = 0;
    (*(s32 *)((u8 *)(temp_v0) + 0x24)) = 0;
    (*(s32 *)((u8 *)(temp_v0) + 0x28)) = 0;
    (*(s32 *)((u8 *)(temp_v0) + 0x2C)) = 0;
    (*(s32 *)((u8 *)(temp_v0) + 0x30)) = 0;
    (*(s32 *)((u8 *)(temp_v0) + 0x40)) = 0;
    (*(s32 *)((u8 *)(temp_v0) + 0x44)) = 0;
}
