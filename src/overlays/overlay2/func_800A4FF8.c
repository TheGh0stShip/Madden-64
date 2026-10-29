#include "types.h"

typedef struct {
    s32 unk00;
    s32 rect[2];
} Box;

typedef struct {
    u8 pad00[0x20];
    s32 unk20;
} Font;

typedef struct {
    u8 pad00[0x20];
    s32 y;
} Cursor;

typedef struct {
    u8 pad00[0x28];
    Font *font;
} Style;

void func_8001F070(Font *, s32, Box *);

void func_800A4FF8(Cursor *cursor, u8 glyph, Style *style) {
    Font *font = style->font;
    Box box;

    if (font->unk20 == 0) {
        box.rect[0] = cursor->y + 0x10;
        func_8001F070(font, glyph + 7, &box);
        cursor->y = box.rect[0] - 0x10;
    }
}
