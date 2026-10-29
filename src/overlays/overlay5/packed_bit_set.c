#include "types.h"

void overlay5_packed_bit_set(u8 *data, s16 index, s16 value) {
    u8 masks[8] = { 1, 2, 4, 8, 0x10, 0x20, 0x40, 0x80 };

    data += index >> 3;
    if (value != 0) {
        *data |= masks[index & 7];
    }
}
