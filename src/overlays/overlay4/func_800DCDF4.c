#include "types.h"

#ifndef NULL
#define NULL 0
#endif

typedef struct { s8 a, b, c, d; } Msg;
s16 func_800B9208(void *, Msg *);                    /* extern */
s32 func_800C0018(void *, s16, s32);        /* extern */
s32 func_800E1BCC(void *, Msg *);                /* extern */

s32 func_800DCDF4(void *arg0, void *arg1) {
    Msg m;
    Msg *mp;
    s32 temp_v1;
    s32 temp_v1_2;
    s32 var_a0;
    s32 var_a1;
    s32 var_v1;
    void *temp_a0;
    s32 big;
    void *temp_a0_2;
    void *temp_a0_3;
    void *temp_v0;
    void *temp_v1_3;

    var_a0 = (*(s32 *)((u8 *)(arg1) + 0));
    if (var_a0 < 0) {
        var_a0 = -var_a0;
    }
    var_v1 = (*(s32 *)((u8 *)(arg1) + 4));
    if (var_v1 < 0) {
        var_v1 = -var_v1;
    }
    if (var_a0 < var_v1) {
        var_a1 = var_v1 + (var_a0 / 2);
    } else {
        var_a1 = var_a0 + (var_v1 / 2);
    }
    temp_a0 = (*(void **)((u8 *)(arg0) + 0x24));
    temp_v1 = (*(s32 *)((u8 *)(temp_a0) + 0x2C));
    if (((*(s32 *)((u8 *)(arg1) + 0)) ^ temp_v1) < 0) {
        (*(s32 *)((u8 *)(temp_a0) + 0x2C)) = (s32) (temp_v1 / 2);
    }
    temp_v1_2 = (*(s32 *)((u8 *)((*(void **)((u8 *)(arg0) + 0x24))) + 0x30));
    if (((*(s32 *)((u8 *)(arg1) + 4)) ^ temp_v1_2) < 0) {
        (*(s32 *)((u8 *)((*(void **)((u8 *)(arg0) + 0x24))) + 0x30)) = (s32) (temp_v1_2 / 2);
    }
    big = var_a1 > 0x1FFFF;
    mp = &m;
    if (big) {
        func_800C0018(arg0, func_800B9208(arg1, mp), 0);
        if ((*(s32 *)((u8 *)(arg1) + 4)) == 0) {
            (*(s32 *)((u8 *)((*(void **)((u8 *)(arg0) + 0x24))) + 0x30)) = 0;
        }
        temp_v1_3 = (*(void **)((u8 *)(arg0) + 0x24));
        (*(s32 *)((u8 *)(temp_v1_3) + 0x14)) = (s32) ((*(s32 *)((u8 *)(temp_v1_3) + 0x14)) & ~0x200);
        return 0;
    }
    temp_a0_2 = (*(void **)((u8 *)(arg0) + 0x24));
    (*(s32 *)((u8 *)(temp_a0_2) + 0x1C)) = (s32) ((*(s32 *)((u8 *)(temp_a0_2) + 0x1C)) + (*(s32 *)((u8 *)(arg1) + 0)));
    temp_a0_3 = (*(void **)((u8 *)(arg0) + 0x24));
    (*(s32 *)((u8 *)(temp_a0_3) + 0x20)) = (s32) ((*(s32 *)((u8 *)(temp_a0_3) + 0x20)) + (*(s32 *)((u8 *)(arg1) + 4)));
    temp_v0 = (*(void **)((u8 *)(arg0) + 0x24));
    (*(s32 *)((u8 *)(temp_v0) + 0x30)) = 0;
    (*(s32 *)((u8 *)(temp_v0) + 0x2C)) = 0;
    m.a = 4;
    m.c = 0x3A;
    m.b = 0;
    m.d = 0x40;
    func_800E1BCC(arg0, mp);
    return 1;
}
