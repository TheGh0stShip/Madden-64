#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_80024EDC(s32);                     /* extern */
s32 func_800DD514(s32 *);                   /* extern */
extern s32 D_800C01D4;

s32 func_800A2BD8(void) {
    func_800DD514(&D_800C01D4);
    func_80024EDC(4);
    return 0x19;
}
