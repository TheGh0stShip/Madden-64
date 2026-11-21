#include "types.h"

typedef struct {
    u8 unk_00[0x1A];
    u16 unk_1A;
    u16 unk_1C;
} MenuDims;

typedef struct {
    u8 unk_00[8];
    MenuDims *unk_08;
} MenuInfo;

u16 text_glyph_width_sum(u8 *text, u8 *font, u32 spacing, u32 bias);
void ui_menu_primary(s8 x, s8 y, s8 w, s8 h, u32 arg4, u8 *font, u32 glyph);

u16 ui_menu_tertiary(u8 x, u8 y, MenuInfo *info, u32 arg3, u8 *text, u8 *font, u32 flags)
{
    u32 width;
    u32 height;
    u32 spacing;
    u16 bias;
    u32 count;
    u8 character;
    u32 index;
    u8 difference;
    u32 step;

    width = info->unk_08->unk_1A;
    height = info->unk_08->unk_1C;
    bias = flags;
    if (flags & 0x8000) {
        spacing = 2;
        bias = flags & 0x7FFF;
    } else {
        spacing = 0;
    }
    if (bias & 0x4000) {
        bias &= ~0x4000;
        x = (s32)(96 - text_glyph_width_sum(text, font, spacing, bias)) / 2;
    }
    count = 0;
    character = *text;
    if (character != 0) {
    step = spacing + 2;
    do {
        index = character & 0xFF;
        count++;
        if (index == ' ') {
            x += step;
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
                }
            }
            character = bias + character;
            {
                u32 offset;
                u8 *p;
                offset = *(u16 *)(font + character * 2 + 2);
                offset += 2;
                offset += *(u16 *)font * 2;
                p = font + offset;
                ui_menu_primary(x, y, width, height, arg3, font, character);
                x += p[2];
            }
        }
        text++;
        character = *text;
    } while (character != 0);
    }
    return count;
}
