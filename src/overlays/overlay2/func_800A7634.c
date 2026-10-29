#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8003CE88(s32, s32, s32);   /* extern */
s32 func_80092B98();                            /* extern */
s32 func_800D3F4C(s32, s32, s32, s32);  /* extern */

void func_800A7634(void *arg0) {
    s32 temp_s0;
    void *temp_s1;

    temp_s1 = (*(void **)((u8 *)(arg0) + 0x60));
    (*(s32 *)((u8 *)(temp_s1) + 4)) = 0;
    func_8003CE88(0x3D, 0x69, 0x10);
    do {
        temp_s0 = (func_800D3F4C(0xA, (*(s32 *)((u8 *)(temp_s1) + 0x24)) + 0x20, 0, 1) << 0x10) != 0;
        func_80092B98();
    } while (!(temp_s0 & 0xFF));
}
