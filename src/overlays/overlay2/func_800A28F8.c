#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8008D72C();                            /* extern */
s32 func_80093FD8();                            /* extern */
s32 func_800DD514(s32 *);                   /* extern */
extern s32 D_800BF2EC;

s32 func_800A28F8(void) {
    func_8008D72C();
    func_80093FD8();
    func_800DD514(&D_800BF2EC);
    return 0x19;
}
