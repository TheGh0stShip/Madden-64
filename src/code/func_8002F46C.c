#include "types.h"

extern s16 D_80084F6C;
extern s16 func_800E154C(s32);
extern u16 func_800E1B0C(void);
extern s32 func_800AD9B8(u16);
extern s16 func_800E1690(s32, s32);
extern void func_800E1E40(void);
extern void func_800E1FCC(s32, s32);
extern void func_800E1418(s32);

s32 func_8002F46C(void)
{
    s32 initial = D_80084F6C;
    s32 done = 0;
    s32 success = 0;
    u8 count = 0;
    s32 one = 1;

    do {
        if (func_800E154C(D_80084F6C) == 0) {
            s16 result = func_800AD9B8(func_800E1B0C());
            if (result == one) {
                if (func_800E1690(0, 0) == 0) {
                    func_800E1E40();
                    success = 1;
                    goto exit;
                }
                func_800E1FCC(0x86D0, 0);
            }
            func_800E1E40();
        }

        {
            s16 current = D_80084F6C;
            register s32 check __asm__("$2");
            func_800E1418(0);
            count++;
            if ((s16)current == D_80084F6C ||
                (D_80084F6C == initial) || count >= 4) {
                done = 1;
            }
            check = done;
            __asm__ volatile("" : : "r"(check));
            if (check) {
                goto exit;
            }
        }
    } while (!done);
exit:
    return success;
}
