#include "types.h"

void func_80042170(u8 *bitmap, u32 frame, u8 *output, u32 stride,
                   u8 bottom, u8 x, u8 y)
{
    register u8 *saved_bitmap __asm__("$10") = bitmap;
    register u32 saved_stride __asm__("$7") = stride;
    register s32 row __asm__("$9");
    register s32 end __asm__("$12");
    register u8 *source __asm__("$11");
    u32 x_value;
    u64 stack_padding;

    __asm__("" : "=r"(saved_bitmap) : "0"(bitmap));
    __asm__("" : : "m"(stack_padding));
    source = saved_bitmap + 2 + (frame & 0xFF) * saved_bitmap[0]
        * saved_bitmap[1];
    row = bottom - y - 1;
    x_value = x;
    end = row - saved_bitmap[0];
    if (end < row) {
        saved_stride &= 0xFF;
        output += row * saved_stride;
        do {
            s32 byte_index;
            s32 one = 1;
            u8 *destination = output + (x_value & 0xFF);

            byte_index = 0;
            if (saved_bitmap[1] > 0) {
                do {
                    s32 bit = 7;
                    u8 *byte_source = source + byte_index;

                    do {
                        if ((*byte_source >> bit) & 1) {
                            *destination = one;
                        }
                        bit--;
                        destination++;
                    } while (bit >= 0);
                    byte_index++;
                } while (byte_index < saved_bitmap[1]);
            }
            row--;
            source += saved_bitmap[1];
            output -= saved_stride;
        } while (end < row);
    }
}
