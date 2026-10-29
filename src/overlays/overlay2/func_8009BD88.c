#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8000C8A0(s32);                             /* extern */
s32 func_8000D834(s32, s32);                    /* extern */
s32 func_8000D874(s32, s32);                    /* extern */
s32 func_80016FC4(u16);                         /* extern */
s32 func_80017C24(s32);                         /* extern */
s32 func_80024E9C();                            /* extern */
s32 func_80032F3C(s32, void *);             /* extern */
s32 func_80035F88(u16, s32);                    /* extern */
s32 func_8003A600(s32, s32);            /* extern */
s32 func_80092B98();                            /* extern */
s32 func_800D57CC();                            /* extern */
s32 func_800D628C();                            /* extern */
void *func_800DD634();                              /* extern */
s32 func_800DD788(s32);                     /* extern */
extern void *D_8007A2B0;
extern u8 D_8007A2B4;
extern u16 D_80084F40;
extern void *D_80087938;
extern s32 D_80088090;
extern s32 D_8008931C;

void func_8009BD88(void *arg0) {
    s32 temp_a1;
    s32 temp_s0;
    void *temp_s0_2;

    func_800D628C();
    temp_s0 = (*(s32 *)((u8 *)(arg0) + 0x3C));
    if (D_8007A2B4 != 0) {
        func_80017C24((*(s32 *)((u8 *)(D_80087938) + 0x74)));
        temp_a1 = (*(s32 *)((u8 *)(D_80087938) + 0x3C));
        if (temp_a1 != 0) {
            func_8000D834(D_8008931C, temp_a1);
        }
    }
    func_8000D874(func_8000C8A0(D_80088090), temp_s0);
    func_8000D834(D_8008931C, temp_s0);
    temp_s0_2 = func_800DD634();
    func_80092B98();
    func_80092B98();
    func_80092B98();
    if (D_8007A2B4 != 0) {
        func_80035F88(D_80084F40, (*(s32 *)((u8 *)(D_80087938) + 0x2C)));
    }
    func_80032F3C(0, D_80087938);
    func_80016FC4((*(u16 *)((u8 *)(arg0) + 0x6E)));
    func_800DD788(0x13);
    func_80032F3C(0, D_8007A2B0);
    func_8003A600(0, 0);
    func_80024E9C();
    func_800D57CC();
    (*(s32 *)((u8 *)(temp_s0_2) + 0x14)) = 0;
    (*(s32 *)((u8 *)(temp_s0_2) + 0x18)) = 0;
    (*(s32 *)((u8 *)(temp_s0_2) + 0x1C)) = 0;
    (*(s32 *)((u8 *)(temp_s0_2) + 0x20)) = 0;
    (*(s32 *)((u8 *)(temp_s0_2) + 0x24)) = 0;
    (*(s32 *)((u8 *)(temp_s0_2) + 0x28)) = 0;
    (*(s32 *)((u8 *)(temp_s0_2) + 0x2C)) = 0;
    (*(s32 *)((u8 *)(temp_s0_2) + 0x30)) = 0;
    (*(s32 *)((u8 *)(temp_s0_2) + 0x40)) = 0;
    (*(s32 *)((u8 *)(temp_s0_2) + 0x44)) = 0;
    (*(s32 *)((u8 *)(temp_s0_2) + 0x48)) = 0;
    (*(s32 *)((u8 *)(temp_s0_2) + 0x4C)) = 0;
}
