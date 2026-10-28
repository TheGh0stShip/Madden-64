#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_800BB170();                                /* extern */
s32 func_800BB438();                                /* extern */

s32 func_800BFD68(void *arg0) {
    s32 var_v0;

    if (!((*(u16 *)((u8 *)(arg0) + 0x28)) & 8)) {
        var_v0 = func_800BB438();
    } else {
        var_v0 = func_800BB170();
    }
    return var_v0 & 0xFFFF;
}
