#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8003A1D0();                                /* extern */
s32 func_800B4208(void *);                      /* extern */
s32 func_800B5F9C(void *);                      /* extern */

void func_800B3F38(void *arg0) {
    u8 temp_v1;

    temp_v1 = *(*(u8 **)((u8 *)(arg0) + 0x60));
    switch (temp_v1) {                              /* irregular */
    case 0:
        if (func_8003A1D0() & 0xFFFF) {
            func_800B4208(arg0);
            return;
        }
        return;
    case 1:
        func_800B5F9C(arg0);
        break;
    }
}
