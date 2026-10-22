#include "types.h"

u16 func_8001A958(u32 value) {
    return ((value & 0xFF) << 8) | ((value & 0xFF00) >> 8);
}

u32 func_8001A970(u32 value) {
    return (value << 24) | ((value & 0xFF00) << 8) |
           ((value >> 8) & 0xFF00) | (value >> 24);
}
