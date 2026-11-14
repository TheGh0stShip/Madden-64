#include "types.h"

typedef struct Font {
    u8 pad00[0x1A];
    u16 width;
    u16 height;
} Font;

typedef struct TextObject {
    u8 pad00[8];
    Font *font;
} TextObject;

extern s8 D_80085027;
extern void func_8001E4B0(s8, s32, s8, s8, u8 *, s32, s32);

void text_line_render(TextObject *text, u8 *buffer, register s32 context, s32 character)
{
    Font *font;
    s32 saved_context;
    u16 height;
    u32 stride;
    u8 fill;
    s32 row;
    u32 half_width;
    s32 offset;
    u32 row_offset;
    s32 value;

    saved_context = context;
    if ((u8)character != 0) {
        font = text->font;
        context = font->width;
        row = 6;
        fill = 0xFF;
        D_80085027 = 0;
        height = font->height;
        stride = (u16)context;
        half_width = stride >> 1;
        row_offset = stride * 6;
        do {
            offset = row_offset >> 1;
            {
                u32 base_offset = offset - 5;
                offset = base_offset + half_width;
            }
            offset--;
            buffer[++offset] = fill;
            buffer[++offset] = fill;
            buffer[++offset] = fill;
            buffer[++offset] = fill;
            offset++;
            row_offset -= stride;
        } while (row-- != 0);

        if ((u8)character != ' ') {
            value = character - 'A';
            if ((u8)value < 26) {
                character = value;
            } else {
                value = character - '0';
                if ((u8)value < 10) {
                    character = value;
                    character += 26;
                } else if ((u8)character == '-') {
                    character = 36;
                }
            }
            func_8001E4B0(context - 7, 6, context, height, buffer,
                          saved_context, (u8)character + 9);
        }
    }
}
