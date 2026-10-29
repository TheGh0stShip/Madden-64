#include "types.h"

s32 func_800E2968(u8 *data, s16 bit);

s16 overlay5_packed_bits_read(u8 *data, s16 bit, s16 count) {
    s32 shift;
    s32 result;
    s16 remaining;

    shift = 0;
    result = 0;
    remaining = count - 1;
    if (count != 0) {
        do {
            result |= (u16)func_800E2968(data, bit) << shift;
            bit++;
            shift++;
        } while (remaining-- != 0);
    }
    return result;
}
