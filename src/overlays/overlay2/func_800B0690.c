#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_80024E9C();                            /* extern */
s32 func_800B07D4(s32);                         /* extern */
s32 func_800D628C(s32);                         /* extern */
void *func_800DD634();                              /* extern */
s32 func_800DD788(s32);                     /* extern */

void func_800B0690(s32 arg0) {
    void *temp_s0;

    temp_s0 = func_800DD634();
    func_800B07D4(arg0);
    func_80024E9C();
    (*(s32 *)((u8 *)(temp_s0) + 0x14)) = 0;
    (*(s32 *)((u8 *)(temp_s0) + 0x18)) = 0;
    (*(s32 *)((u8 *)(temp_s0) + 0x1C)) = 0;
    (*(s32 *)((u8 *)(temp_s0) + 0x20)) = 0;
    func_800DD788(0x12);
    func_800D628C(arg0);
}
