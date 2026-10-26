#include "types.h"

#define M2C_UNK s32
#define M2C_FIELD(x, type, offset) (*(type)((u8 *)(x) + (offset)))
#define sp24 (sp20[1])
#define sp90 (sp20[0x1C])
#define sp94 (sp20[0x1D])
#define sp9C (sp20[0x1F])
#define spAC (sp20[0x23])

typedef struct {
    s32 context[0x74];
    u8 aux[0x8E];
    volatile u16 saved_arg1;
    u8 pad[6];
    volatile u16 saved_arg3;
} DecodeLocals;

#define sp20 (locals.context)
#define sp1F0 (locals.aux)
#define sp27E (locals.saved_arg1)
#define sp286 (locals.saved_arg3)

M2C_UNK func_80017840(void *, s32, s32, s16, s32, s32, s32);
M2C_UNK func_8001AA60(s32, s32, s16);
s32 func_80032E00(M2C_UNK, s32);
M2C_UNK func_80054768(s32 *);
M2C_UNK func_800549E8(s32 *, s32 *, M2C_UNK);
M2C_UNK func_80054DB0(s32 *, M2C_UNK, M2C_UNK);
M2C_UNK func_80054ED0(s32 *);
M2C_UNK func_800551B4(s32 *, M2C_UNK);
M2C_UNK func_80055444(s32 *);
M2C_UNK func_8005560C(s32 *, s32);
s32 func_80063530(M2C_UNK *);

void resource_archive_decode(void *arg0, u16 arg1, s16 arg2, u16 arg3,
                             s32 arg4, s32 arg5, s32 arg6)
{
    register void *saved_s6 __asm__("$22") = arg0;
    s16 saved_fp = arg2;
    DecodeLocals locals;
    register s32 *temp_s3 __asm__("$19");
    register s32 var_s0 __asm__("$16");
    register s32 var_s1 __asm__("$17");
    register s32 var_s5 __asm__("$21");
    register s32 var_s7 __asm__("$23");
    register s32 var_s2 __asm__("$18");
    register s32 var_s4 __asm__("$20");
    register s32 var_v0 __asm__("$2");
    register s32 temp_a0 __asm__("$4");
    register s32 temp_v1 __asm__("$3");
    register s32 temp_v0 __asm__("$2");

    sp27E = arg1;
    sp286 = arg3;
    sp20[0] = func_80063530((s32 *)sp1F0);
    func_80054DB0(sp20, 0x3D, 0x1D0);
    func_8005560C(sp20, arg5);
    func_800551B4(sp20, 1);
    func_80054768(sp20);
    temp_s3 = M2C_FIELD(sp24,
                         s32 *(**)(s32 *, M2C_UNK, s32, M2C_UNK),
                         8)(sp20, 1, sp90 * sp9C, 1);
    if (!(M2C_FIELD(saved_s6, s32 *, 0x30) & 0x80)) {
        goto block_2;
    }
    var_s5 = arg6;
    var_s0 = var_s5;
    goto block_3;
block_2:
    var_s5 = func_80032E00(0, sp90 * sp94 * 2);
    var_s0 = var_s5;
block_3:
    temp_a0 = sp90;
    temp_v1 = sp94;
    temp_v0 = spAC;
    var_s1 = temp_a0;
    var_s7 = temp_v1;
    if ((u32)temp_v0 >= (u32)temp_v1) {
        goto block_6;
    }
    temp_v0 = temp_a0 << 16;
    var_s2 = temp_v0 >> 16;
    var_s4 = var_s2 * 2;
loop_5:
    func_800549E8(sp20, temp_s3, 1);
    func_8001AA60(var_s0, *temp_s3, var_s2);
    var_s0 += var_s4;
    if ((u32)spAC < (u32)sp94) {
        goto loop_5;
    }
block_6:
    func_80055444(sp20);
    func_80054ED0(sp20);
    func_80017840(saved_s6, var_s1 & 0xFFFF, var_s7 & 0xFFFF, saved_fp,
                  (s32)(s16)sp286, (s32)(s16)sp27E, 0x10);
    if (var_s1 & 3) {
        var_v0 = var_s1 + 1;
        do {
            var_s1 = var_v0;
            var_v0 &= 3;
            if (var_v0 == 0) {
                break;
            }
            var_v0 = var_s1 + 1;
        } while (1);
    }
    M2C_FIELD(saved_s6, s16 *, 0x1E) = (s16)var_s1;
    M2C_FIELD(saved_s6, s32 *, 4) = var_s5;
    M2C_FIELD(saved_s6, s32 *, 8) = 0;
}
