#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_800DD514(s32 *);                   /* extern */
extern s16 D_800BDF0A;
extern s32 D_800BF3D4;
extern u8 D_800C509E;

s32 func_800A84D0(void) {
    D_800BDF0A = (s16) D_800C509E;
    func_800DD514(&D_800BF3D4);
    return 0x19;
}
