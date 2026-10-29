#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_800ACA58(void *, s32);             /* extern */
s32 func_800ACC64(void *);                      /* extern */
s32 func_800ADC50(s16, s16, s32);           /* extern */

void func_800AD014(void *arg0, s16 arg1) {
    func_800ADC50((*(s16 *)((u8 *)(arg0) + 0x66)), arg1, 0);
    func_800ACC64(arg0);
    func_800ACA58(arg0, 6);
}
