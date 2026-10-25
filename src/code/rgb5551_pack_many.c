#include "types.h"

void rgb5551_pack_many(u16 *output, const u8 *input, s32 count)
{
    register u16 *destination __asm__("$8") = output;
    register const u8 *source __asm__("$9") = input;
    register s32 remaining __asm__("$6");
    register const u8 *blue __asm__("$7");
    register s32 initial __asm__("$2");
    register s32 current __asm__("$5");
    register u32 red __asm__("$2");
    register u32 green __asm__("$3");
    register u32 blue_value __asm__("$4");

    remaining = (s16)count;
    initial = remaining;
    remaining--;
    if (initial == 0) {
        return;
    }
    blue = input + 2;
    do {
        red = source[0];
        green = blue[-1];
        blue_value = blue[0];
        blue += 3;
        source += 3;
        current = remaining;
        remaining--;
        red >>= 3;
        green >>= 3;
        blue_value >>= 3;
        *destination = (red << 11) | (green << 6) |
                       (blue_value << 1) | 1;
        destination++;
    } while (current != 0);
}
