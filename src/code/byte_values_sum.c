#include "types.h"

register s32 encoded_size asm("$7");

s32 func_8003720C(u8* data, s32 size) {
    volatile u32 unused;
    register s32 index asm("$6");
    register s32 total asm("$3");

    encoded_size = 0;
    index = encoded_size & 0;
    total = index & 0;
    if (size > 0) {
        do {
            s32 value = *data++;

            value &= 0xFF;

            if (value != 0) {
                encoded_size += 2;
            }
            total += value;
            index++;
        } while (index < size);
    }
    return total;
}
