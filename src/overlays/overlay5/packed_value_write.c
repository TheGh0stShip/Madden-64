#include "types.h"

void overlay5_packed_value_write(
    u8 *record,
    s32 value,
    s16 extended
) {
    if (extended == 0) {
        record[0xB] = 0x6B - value;
    } else {
        u16 packed;

        record += 0xF;
        packed = value + 0xE4;
        record[0] = packed;
        record[1] = packed >> 8;
    }
}
