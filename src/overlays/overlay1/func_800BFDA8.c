#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_800BB170();                                /* extern */
s32 func_800BB438();                                /* extern */
extern s32 D_80080C10;

s32 func_800BFDA8(void *arg0) {
    if (D_80080C10 & 0x800) {
        if ((*(u16 *)((u8 *)(arg0) + 0x28)) & 8) {
            return func_800BB170() & 0xFFFF;
        }
        return func_800BB438() & 0xFFFF;
    }
    (*(u16 *)((u8 *)(arg0) + 0x28)) = (u16) ((*(u16 *)((u8 *)(arg0) + 0x28)) & 0xFFFE);
    return 0;
}
