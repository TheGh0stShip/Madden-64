#include "types.h"

typedef struct {
    u8 pad48[0x48];
    u16 values[4];
    u16 index;
    u16 field52;
    u16 field54;
    u8 pad56[4];
    s16 field5A;
} C78Object;

extern s32 func_80022538();
extern s32 func_80022B3C();
extern void func_800259E4();
extern void func_80025A4C();
extern s32 func_80031A1C();
extern void func_800C61A4();

void func_800C78AC(C78Object *arg0) {
    s32 temp_s0_35;
    s32 temp_s1_40;
    s32 temp_s3_18;

    temp_s3_18 = func_80022538(arg0->index, 1, 0x15, 0) & 0xFFFF;
    func_80025A4C(arg0->index, temp_s3_18, 0x17, 1);
    if ((u32)(func_80031A1C(0x64) & 0xFFFF) >= 2U) {
        temp_s0_35 = func_80031A1C(0x100) & 0xFFFF;
        temp_s1_40 = func_80022B3C(arg0->index, temp_s3_18, 9);
        if (temp_s0_35 <
            (s32)(((temp_s1_40 & 0xFFFF) +
                   (func_80022B3C(arg0->index, temp_s3_18, 0xA) & 0xFFFF)) >> 1)) {
            func_80025A4C(arg0->index, temp_s3_18, 0x18, 1);
            if (arg0->field5A != 0) {
                func_800259E4(arg0->index, 0x11, 1);
                func_800259E4(arg0->field52, 0x14, 1);
            }
            arg0->values[arg0->index] += 3;
            func_800C61A4(arg0);
            return;
        }
        goto block_6;
    }
    func_80025A4C(arg0->index, temp_s3_18, 0x19, 1);
block_6:
    arg0->field54++;
}
