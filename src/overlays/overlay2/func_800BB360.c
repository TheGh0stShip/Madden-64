#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8003A1D0();                                /* extern */

s32 func_800BB360(void) {
    return (u32) (func_8003A1D0() & 0xFFFF) < 0x7FU;
}
