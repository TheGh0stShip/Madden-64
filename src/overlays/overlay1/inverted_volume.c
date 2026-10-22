#include "types.h"

u8 func_800C3D48(u16 value) {
    value >>= 1;
    if (value >= 0x80) {
        value = 0x7F;
    }
    return ~value;
}
