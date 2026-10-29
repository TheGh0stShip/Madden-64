#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_800DB0AC(s32, s32, s32);       /* extern */

void func_800B1648(void *arg0) {
    void *temp_s0;

    temp_s0 = (*(void **)((u8 *)(arg0) + 0x60));
    func_800DB0AC((*(s32 *)((u8 *)((*(void **)((u8 *)(temp_s0) + 0x28))) + 0xC)), 0, 0);
    func_800DB0AC((*(s32 *)((u8 *)((*(void **)((u8 *)(temp_s0) + 0x24))) + 0xC)), 0, 0);
}
