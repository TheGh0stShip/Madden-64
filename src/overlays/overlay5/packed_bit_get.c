#include "types.h"

s32 overlay5_packed_bit_get(u8 *data, s16 index) {
    u8 masks[8] = { 1, 2, 4, 8, 0x10, 0x20, 0x40, 0x80 };
    s32 bit;

    data += index >> 3;
    bit = index & 7;
    return (*data & masks[bit]) >> bit;
}
