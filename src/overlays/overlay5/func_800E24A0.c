#include "types.h"

s32 func_800E24A0(u8* data, s32 size) {
    volatile u32 unused;
    s32 encoded_size = 0;
    s32 index = 0;
    s32 total = 0;

    if (size > 0) {
        do {
            s32 value = *data++;

            value &= 0xFF;
            if (value != 0) {
                encoded_size += 2;
            }
            total += value;
            total += (value >> 8) & encoded_size;
            index++;
        } while (index < size);
    }
    return total;
}
