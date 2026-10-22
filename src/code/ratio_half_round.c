#include "types.h"

s32 func_8006012C(s32 unused0, s32 unused1, s32 value, s32 scale) {
    return ((value * 2 + 1) * 255 + scale) / (scale * 2);
}
