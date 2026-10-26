#include "types.h"

u16 text_glyph_width_sum(u8 *text, u8 *font, u32 spacing, u32 bias)
{
    u32 total = 0;
    u32 character;
    u32 index;
    register u32 offset __asm__("$2");
    u32 difference;
    register u32 header __asm__("$3");

    character = *text;
    if (character != 0) do {
        index = character & 0xFF;
        if (index == ' ' || index == '\'') {
            offset = total + 2;
            __asm__("" : "=r"(offset) : "0"(offset));
            total = spacing + offset;
        } else {
            difference = character - 'A';
            if ((u8)difference < 26) {
                character = difference;
            } else {
                difference = character - '0';
                if ((u8)difference < 10) {
                    __asm__("" : "=r"(difference) : "0"(difference));
                    character = difference + 26;
                } else if (index == '-') {
                    character = 36;
                } else if (index == '.') {
                    character = 37;
                }
            }
            character += bias;
            offset = *(u16 *)(font + ((character & 0xFF) * 2) + 2);
            __asm__("" : "=r"(offset) : "0"(offset));
            offset += 2;
            header = *(u16 *)font;
            offset += header * 2;
            total += *(font + offset + 2);
        }
        text++;
        character = *text;
    } while (character != 0);
    return total;
}
