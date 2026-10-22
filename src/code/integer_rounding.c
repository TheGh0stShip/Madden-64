#include "types.h"

s32 func_800631D8(s32 value, s32 alignment) {
    return (value + alignment - 1) / alignment;
}

s32 func_80063214(s32 value, s32 alignment) {
    value--;
    value += alignment;
    return value - value % alignment;
}
