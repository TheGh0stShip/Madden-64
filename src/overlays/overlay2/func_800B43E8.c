#include "types.h"

#ifndef NULL
#define NULL 0
#endif

void *func_80032E00(s32, s32);                  /* extern */
s32 func_8003A1D0();                                /* extern */

void func_800B43E8(void *arg0) {
    s32 temp_s1;
    void *temp_s0;

    temp_s1 = func_8003A1D0() & 0xFFFF;
    if (temp_s1 != 0) {
        temp_s0 = func_80032E00(0, 0xC);
        (*(void **)((u8 *)(temp_s0) + 0)) = func_80032E00(0, temp_s1 * 2);
        (*(void **)((u8 *)(temp_s0) + 4)) = func_80032E00(0, temp_s1 * 0x28);
        (*(void **)((u8 *)(arg0) + 8)) = temp_s0;
        return;
    }
    (*(void **)((u8 *)(arg0) + 8)) = NULL;
}
