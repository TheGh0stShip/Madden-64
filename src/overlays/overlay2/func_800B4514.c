#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_80032F3C(s32, void *);             /* extern */

void func_800B4514(void *arg0) {
    void *temp_a1;

    temp_a1 = (*(void **)((u8 *)(arg0) + 8));
    if (temp_a1 != NULL) {
        func_80032F3C(0, (*(void **)((u8 *)(temp_a1) + 0)));
        func_80032F3C(0, (*(void **)((u8 *)((*(void **)((u8 *)(arg0) + 8))) + 4)));
        func_80032F3C(0, (*(void **)((u8 *)(arg0) + 8)));
    }
}
