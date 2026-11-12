#include "types.h"

u16 text_glyph_width_sum(u8 *text, u8 *font, u32 spacing, u32 bias)
{
    u32 total = 0;
    u32 character;
    u32 index;
    u32 difference;

    character = *text;
    if (character != 0) do {
        index = character & 0xFF;
        if (index == ' ' || index == '\'') {
            u32 offset;
            offset = total + 2;
            total = spacing + offset;
        } else {
            difference = character - 'A';
            if ((u8)difference < 26) {
                character = difference;
            } else {
                difference = character - '0';
                if ((u8)difference < 10) {
                    character = difference;
                    character += 26;
                } else if (index == '-') {
                    character = 36;
                } else if (index == '.') {
                    character = 37;
                }
            }
            character += bias;
            {
                u32 offset;
                u32 header;
                offset = *(u16 *)(font + ((character & 0xFF) * 2) + 2);
                offset += 2;
                header = *(u16 *)font;
                offset += header * 2;
                total += *(font + offset + 2);
            }
        }
        text++;
        character = *text;
    } while (character != 0);
    return total;
}
