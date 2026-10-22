#include "types.h"

extern s32 D_8008617C;

s32 func_80036628(s32 base, s32 offset) {
    D_8008617C = base + offset;
    return 0;
}
