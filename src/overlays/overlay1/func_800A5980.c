#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_800C0BBC(void *, s32);                     /* extern */

s32 func_800A5980(void *arg0) {
    void *temp_a1;

    func_800C0BBC(arg0, 0x42);
    temp_a1 = (*(void **)((u8 *)(arg0) + 0x24));
    (*(s32 *)((u8 *)(arg0) + 0x94)) = 0;
    (*(s32 *)((u8 *)(temp_a1) + 0x14)) = (s32) ((*(s32 *)((u8 *)(temp_a1) + 0x14)) & ~0x200);
    return 0;
}
