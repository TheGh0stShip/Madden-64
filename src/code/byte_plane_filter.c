#include "types.h"

#define M2C_FIELD(x, type, offset) (*(type)((u8 *)(x) + (offset)))

void byte_plane_filter(void *arg0, void *arg1, void **arg2, void ***arg3)
{
    volatile u64 stack_pad;
    register void *saved_t4 __asm__("$12") = arg0;
    s32 var_t2;
    register s32 var_t3 __asm__("$11");
    register u8 *var_t1 __asm__("$9");
    register s32 temp_v0 __asm__("$2");
    register s32 temp_v1 __asm__("$3");
    register s32 temp_a0 __asm__("$4");
    u8 temp_a0_2;
    u8 temp_a0_4;
    register u8 *var_t0 __asm__("$8");

    arg3 = *arg3;
    var_t3 = 0;
    if (M2C_FIELD(saved_t4, s32 *, 0x134) <= 0) {
        goto block_4;
    }

loop_1:
    var_t1 = *arg2;
    var_t0 = *arg3;
    temp_a0 = *var_t1++;
    *var_t0++ = temp_a0;
    temp_v0 = *var_t1;
    temp_v1 = temp_a0 << 1;
    temp_v1 += temp_a0;
    temp_v1 += temp_v0;
    temp_v1 += 2;
    temp_v1 = (u32)temp_v1 >> 2;
    *var_t0 = temp_v1;
    var_t2 = M2C_FIELD(arg1, s32 *, 0x28) - 2;
    var_t0++;
    if (var_t2 == 0) {
        goto block_3;
    }

loop_2:
    temp_a0 = *var_t1++;
    temp_v0 = var_t1[-2];
    temp_v1 = temp_a0 << 1;
    temp_a0 = temp_v1 + temp_a0;
    temp_v0 = temp_a0 + temp_v0 + 1;
    temp_v0 = (u32)temp_v0 >> 2;
    *var_t0 = temp_v0;
    temp_v0 = *var_t1;
    var_t2--;
    var_t0++;
    temp_v0 = temp_a0 + temp_v0 + 2;
    temp_v0 = (u32)temp_v0 >> 2;
    *var_t0++ = temp_v0;
    if (var_t2 != 0) {
        goto loop_2;
    }

block_3:
    temp_a0 = *var_t1;
    arg3++;
    temp_v0 = var_t1[-1];
    temp_v1 = temp_a0 << 1;
    temp_v1 += temp_a0;
    temp_v1 += temp_v0;
    temp_v1 += 1;
    temp_v1 = (u32)temp_v1 >> 2;
    *var_t0 = temp_v1;
    var_t0[1] = temp_a0;
    var_t3++;
    arg2++;
    if (var_t3 < M2C_FIELD(saved_t4, s32 *, 0x134)) {
        goto loop_1;
    }

block_4:
    return;
}
