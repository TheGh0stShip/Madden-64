#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_80017C24(s32);                         /* extern */
extern void *D_80087938;

void func_800A3A74(s32 arg0) {
    s32 var_a0;

    if (!(arg0 & 0xFFFF)) {
        var_a0 = (*(s32 *)((u8 *)(D_80087938) + 0x50));
    } else {
        var_a0 = (*(s32 *)((u8 *)(D_80087938) + 0x74));
    }
    func_80017C24(var_a0);
}
