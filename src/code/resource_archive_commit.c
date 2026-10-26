#include "types.h"

#define M2C_UNK s32
#define M2C_FIELD(x, type, offset) (*(type)((u8 *)(x) + (offset)))

s32 func_80032E00(M2C_UNK, s32);
M2C_UNK func_80033308(M2C_UNK, s32, s32, M2C_UNK);

void resource_archive_commit(void *arg0, s8 arg1)
{
    register s32 saved_s3 __asm__("$19") = arg1;
    register s32 temp_s0 __asm__("$16");
    s32 width;
    s32 divisor;
    register s32 remainder __asm__("$3");
    register s32 temp_v0 __asm__("$2");
    register s32 temp_s1 __asm__("$17");
    u16 temp_v1;
    u16 temp_v1_2;
    register void *temp_s2 __asm__("$18");
    void *var_v1;
    register s32 var_a0 __asm__("$4");

    temp_s2 = M2C_FIELD(arg0, void **, 8);
    if (M2C_FIELD(temp_s2, s32 *, 0x40) != 0) {
        goto block_4;
    }
    width = (s16)M2C_FIELD(temp_s2, u16 *, 0x1E);
    divisor = 0x800 / width;
    M2C_FIELD(temp_s2, s32 *, 0x30) |= 0x8000;
    temp_v1_2 = M2C_FIELD((width >> 3) * 2 + 0x80060000, u16 *, 0x4AB0);
    if ((s32)temp_v1_2 < divisor) {
        divisor = temp_v1_2;
    }
    temp_v0 = M2C_FIELD(temp_s2, s16 *, 0x1C);
    remainder = temp_v0 % divisor;
    temp_v0 /= divisor;
    temp_s1 = temp_v0 + 1;
    temp_s1 += remainder != 0;
    temp_s1 *= 2;
    __asm__("" : "=r"(temp_s1) : "0"(temp_s1));
    temp_s0 = temp_s1 << 5;
    temp_v0 = func_80032E00(0, temp_s0);
    M2C_FIELD(temp_s2, s32 *, 0x40) = temp_v0;
    M2C_FIELD(temp_s2, s32 *, 0x44) = temp_v0 + (temp_s1 * 0x10);
    func_80033308(0, M2C_FIELD(temp_s2, s32 *, 0x40), temp_s0, 0);
    M2C_FIELD(temp_s2, u16 *, 0x10) = temp_s1;

block_4:
    temp_s1 = M2C_FIELD(temp_s2, u16 *, 0x10);
    var_v1 = M2C_FIELD(temp_s2, void **, 0x40);
    temp_v0 = temp_s1;
    temp_s1 -= 1;
    if (temp_v0 == 0) {
        goto block_7;
    }
    var_a0 = 0xFF;
    var_v1 += 0x1C;

loop_6:
    M2C_FIELD(var_v1, s8 *, -0xD) = arg1;
    M2C_FIELD(var_v1, s8 *, 3) = arg1;
    M2C_FIELD(var_v1, s8 *, -0xE) = var_a0;
    M2C_FIELD(var_v1, s8 *, -0xF) = var_a0;
    M2C_FIELD(var_v1, s8 *, -0x10) = var_a0;
    M2C_FIELD(var_v1, s8 *, 2) = var_a0;
    M2C_FIELD(var_v1, s8 *, 1) = var_a0;
    M2C_FIELD(var_v1, s8 *, 0) = var_a0;
    var_v1 += 0x20;
    temp_v0 = temp_s1;
    temp_s1 -= 1;
    if (temp_v0 != 0) {
        goto loop_6;
    }

block_7:
    return;
}
