#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_80032F3C(s32, s32);                /* extern */
s32 func_800D5D28(void *);                      /* extern */
s32 func_800D628C(void *);                      /* extern */
void *func_800DD634();                              /* extern */
s32 func_800DD788(s32);                     /* extern */
s32 func_800E1E40();                            /* extern */

void func_800AC70C(void *arg0) {
    void *temp_s0;

    temp_s0 = func_800DD634();
    func_800DD788(0x10);
    (*(s32 *)((u8 *)(temp_s0) + 0x24)) = 0;
    (*(s32 *)((u8 *)(temp_s0) + 0x28)) = 0;
    (*(s32 *)((u8 *)(temp_s0) + 0x2C)) = 0;
    (*(s32 *)((u8 *)(temp_s0) + 0x30)) = 0;
    func_800D628C(arg0);
    func_800D5D28(arg0);
    func_80032F3C(0, (*(s32 *)((u8 *)(arg0) + 0xAC)));
    func_80032F3C(0, (*(s32 *)((u8 *)(arg0) + 0xB0)));
    if ((*(s32 *)((u8 *)(arg0) + 0x68)) == 1) {
        func_800E1E40();
    }
}
