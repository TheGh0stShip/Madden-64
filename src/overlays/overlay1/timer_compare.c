#include "types.h"

extern u16 D_80082D94;
extern u16 D_80084EE0;

s32 func_80097AC8(void) {
    return D_80082D94 < D_80084EE0;
}
