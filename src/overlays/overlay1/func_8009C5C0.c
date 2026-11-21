#include "types.h"

typedef struct {
    u16 x;
    u16 r;
    u16 g;
    u16 b;
} TextStyle;

void func_8001E4B0(s8 x, s8 r, s8 g, s8 b, s32 arg4, u16 *font, s32 glyph);
extern u16 *D_80065450;
extern u16 *D_80065454;

s32 func_8009C5C0(TextStyle *style, s32 arg1, u8 *str, s32 flags) {
    u16 x;
    s32 r;
    s32 g;
    s32 b;
    u16 count;
    u8 ch;
    u8 *glyph;
    s32 off;

    count = 0;
    x = style->x;
    g = style->g;
    b = style->b;
    r = style->r;
    ch = *str;
    while (ch != 0) {
        count++;
        if ((ch == ' ') | (ch == '\'')) {
            x += 2;
        } else {
            if ((u8)(ch - 'A') < 26) {
                ch = ch - 'A';
            } else if ((u8)(ch - '0') < 10) {
                ch -= '0';
                ch += 26;
            } else if (ch == '-') {
                ch = 36;
            } else if (ch == '.') {
                ch = 37;
            }
            if (!(flags & 2)) {
                u16 *font = D_80065450;
                u16 idx = ch;
                off = font[idx + 10] + 2;
                off += font[0] * 2;
                glyph = (u8 *)font + off;
                func_8001E4B0(x, r, g, b, arg1, font, ch + 9);
            } else {
                u16 *font = D_80065454;
                u16 idx = ch;
                off = font[idx + 1] + 2;
                off += font[0] * 2;
                glyph = (u8 *)font + off;
                func_8001E4B0(x, r, g, b, arg1, font, idx);
            }
            x += glyph[2];
        }
        str++;
        ch = *str;
    }
    return count;
}
