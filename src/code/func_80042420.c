#include "types.h"

typedef struct {
    s32 value;
    u8 pad04[0x28];
} Entry42420;

void func_8002E17C(s32 arg0, s32 arg1, s32 arg2);
void func_80042170(s32 arg0, u8 digit, s32 arg2, s32 arg3, s32 arg4,
                   s32 arg5, s32 arg6);

extern Entry42420 D_8007A904[];
extern s32 D_8007A9AC;

void func_80042420(s32 arg0, u8 arg1, u8 arg2) {
    u8 ones;
    u8 tens;
    u8 digit;

    func_8002E17C(arg0, D_8007A904[arg1].value, 0x800);
    if (arg2 < 100) {
        tens = arg2 / 10;
        ones = arg2 % 10;
        if ((tens != 0) | (arg2 == 0)) {
            digit = tens + 2;
            func_80042170(D_8007A9AC, digit, arg0, 0x20, 0x40, 0x13, 0x2C);
            digit = ones + 2;
            func_80042170(D_8007A9AC, digit, arg0, 0x20, 0x40, 0x18, 0x2C);
        } else {
            func_80042170(D_8007A9AC, ones, arg0, 0x20, 0x40, 0x15, 0x2C);
        }
    }
}
