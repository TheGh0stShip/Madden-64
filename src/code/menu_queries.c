#include "types.h"

extern s16 D_80087A80;
extern s16 D_800894F8;

s32 func_8002098C(void) {
    return D_80087A80 != 0;
}

s32 func_8002099C(void) {
    return D_800894F8 != 0;
}
