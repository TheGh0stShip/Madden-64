#include "types.h"

extern s16 D_80084F6C;
s16 func_800E154C(s16);
u16 func_800E1B0C(void);
s16 func_800AD9B8(u16);
s16 func_800E1690(s32, s32);
void func_800E1E40(void);
void func_800E1FCC(s32, s32);
void func_800E1418(s32);

s32 func_8002F46C(void) {
    s16 initial = D_80084F6C;
    s16 done = 0;
    s32 success = 0;
    u8 count = 0;
    u16 current;

    do {
        if (func_800E154C(D_80084F6C) == 0) {
            if (func_800AD9B8(func_800E1B0C()) == 1) {
                if (func_800E1690(0, 0) == 0) {
                    func_800E1E40();
                    success = 1;
                    break;
                }
                func_800E1FCC(0x86D0, 0);
            }
            func_800E1E40();
        }
        current = D_80084F6C;
        func_800E1418(0);
        count++;
        if ((s16)current == D_80084F6C || D_80084F6C == initial || count >= 4) {
            done = 1;
        }
    } while (!done);
    return success;
}
