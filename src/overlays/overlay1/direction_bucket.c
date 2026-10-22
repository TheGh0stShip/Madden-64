#include "types.h"

s16 func_800B9208(void);

s32 func_800BDA20(void) {
    return ((func_800B9208() + 0x100) >> 9) & 7;
}
