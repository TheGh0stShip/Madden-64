#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_800DD514(s32 *);                   /* extern */
extern s32 D_800BF394;
extern s32 D_800BF3B4;
extern u8 D_800C509C;

s32 func_800AD7EC(void) {
    s32 *var_a0;

    if ((u32) (D_800C509C - 1) < 0x13U) {
        var_a0 = &D_800BF394;
        goto block_4;
    }
    if ((s8) D_800C509C >= 0x14) {
        var_a0 = &D_800BF3B4;
block_4:
        func_800DD514(var_a0);
    }
    return 0x19;
}
