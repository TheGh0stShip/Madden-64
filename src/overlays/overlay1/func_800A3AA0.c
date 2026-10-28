#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8009F4D4(void *, u8, void *);          /* extern */
s32 func_800C0018(void *, s16, s32);        /* extern */
s32 func_800E1BCC(void *, s8 *, void *);        /* extern */
extern void *D_80086178;
extern s8 D_80069E70[];
extern s8 D_80069E74[];

s32 func_800A3AA0(void *arg0, s32 arg1, void *arg2) {
    s8 sp10;
    s32 var_a0;
    s32 var_s0;
    s32 var_v1;
    s32 var_v1_2;
    s8 temp_a1_2;
    s32 temp_s0;
    u8 temp_a1;
    void *var_a2;

    var_a2 = arg2;
    if ((*(s16 *)((u8 *)(arg0) + 0x30)) >= 0x29) {
        var_a2 = (*(void **)((u8 *)(arg0) + 0x24));
        var_a0 = (*(s32 *)((u8 *)(D_80086178) + 0x1C)) - (*(s32 *)((u8 *)(var_a2) + 0x1C));
        if (var_a0 < 0) {
            var_a0 = -var_a0;
        }
        var_v1 = (*(s32 *)((u8 *)(D_80086178) + 0x20)) - (*(s32 *)((u8 *)(var_a2) + 0x20));
        if (var_v1 < 0) {
            var_v1 = -var_v1;
        }
        if (var_a0 < var_v1) {
            var_v1_2 = var_v1 + (var_a0 / 2);
        } else {
            var_v1_2 = var_a0 + (var_v1 / 2);
        }
        if ((var_v1_2 <= 0x9FFFFF) || (((*(u8 *)((u8 *)((*(void **)((u8 *)(arg0) + 0x38))) + 0x21)) & 0xC0) == 0x40)) {
            sp10 = 0x38;
            func_800E1BCC(arg0, &sp10, var_a2);
            return 0;
        }
        goto block_11;
    }
block_11:
    temp_a1 = (*(u8 *)((u8 *)(arg0) + 0x1F));
    temp_s0 = D_80069E70[temp_a1];
    if (((temp_s0 == 0) | (temp_s0 >= 0x64)) != 0) {
        func_8009F4D4(arg0, temp_a1, var_a2);
        temp_s0 += 1;
    } else {
        temp_a1_2 = D_80069E74[temp_a1];
        if (temp_a1_2 >= 0) {
            func_800C0018(arg0, (s16) (temp_a1_2 << 9), 0);
        }
        temp_s0 += 1;
    }
    temp_s0 &= 3;
    D_80069E70[(*(u8 *)((u8 *)(arg0) + 0x1F))] = temp_s0;
    return 0;
}
