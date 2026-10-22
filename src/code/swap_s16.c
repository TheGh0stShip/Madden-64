#include "types.h"

s16 func_80016C24(s16 value) {
    return ((value & 0xFF) << 8) | ((value & 0xFF00) >> 8);
}
