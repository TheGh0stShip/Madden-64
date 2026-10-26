#include "types.h"

s32 decode_lz_type_1(u8 *source, u8 *destination)
{
    register u32 control __asm__("$6") = source[5];
    register s32 output __asm__("$10") = 0;
    register s32 consumed __asm__("$11") = 5;

    if (control != 0) {
        register s32 initial __asm__("$13") = 0;
        register u8 *input __asm__("$9") = source + 5;
        do {
            register s32 count __asm__("$12");
            input++;
            count = control & 0x80;
            consumed++;
            if (count != 0) {
                register s32 literal_count __asm__("$3") = control & 0x7F;
                register s32 index __asm__("$8") = 0;
                if (initial < literal_count) {
                    register u8 *out __asm__("$7");
                    register u8 *in __asm__("$6");
                    register s32 next __asm__("$2");
                    count = literal_count;
                    out = (u8 *)((u32)output + (u32)destination);
                    in = (u8 *)((u32)consumed + (u32)source);
                    do {
                        register u8 value __asm__("$3") = *in;
                        in++;
                        input++;
                        consumed++;
                        output++;
                        next = index + 1;
                        index = next;
                        __asm__("" : "=r"(next) : "0"(next));
                        *out = value;
                        out++;
                    } while ((s16)next < count);
                }
            } else {
                register u32 low __asm__("$3");
                register u32 high __asm__("$2");
                register s32 distance __asm__("$7");
                register s32 start __asm__("$7");
                register s32 index __asm__("$8");
                register s32 token_count __asm__("$3");
                register s32 check __asm__("$2");
                low = input[0];
                high = input[1];
                input += 2;
                consumed += 2;
                index = 0;
                __asm__("" : "=r"(index) : "0"(0));
                __asm__("" : "=r"(low) : "0"(low));
                __asm__("" : "=r"(high) : "0"(high));
                high <<= 8;
                distance = low + high;
                token_count = control;
                __asm__("" : "=r"(token_count) : "0"(token_count));
                __asm__("" : "=r"(count) : "0"(count));
                check = count < token_count;
                __asm__("" : "=r"(check) : "0"(check));
                start = output - distance;
                if (check) {
                    register s32 loop_count __asm__("$12") = token_count;
                    register u8 *out __asm__("$6") =
                        (u8 *)((u32)output + (u32)destination);
                    register s32 next __asm__("$2");
                    do {
                        register u8 value __asm__("$3");
                        output++;
                        value = destination[start + (s16)index];
                        next = index + 1;
                        index = next;
                        __asm__("" : "=r"(next) : "0"(next));
                        *out = value;
                        out++;
                    } while ((s16)next < loop_count);
                }
            }
            control = *input;
        } while (control != 0);
    }
    return output;
}
