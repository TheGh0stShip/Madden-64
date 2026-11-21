#include "types.h"

typedef struct {
    u8 unk_00[0x1A];
    u16 unk_1A;
    u16 unk_1C;
} UiFont;

typedef struct {
    u8 unk_00[8];
    UiFont *unk_08;
} UiText;

void ui_menu_secondary(s8 x, s32 y, s8 font_w, s8 font_h, s32 arg4, s32 arg5, s32 style);
void ui_menu_tertiary(s32 x, s32 y, UiText *text, s32 arg3, s32 arg4, s32 arg5, s32 flags);
extern s8 D_80085027;

void ui_text_update(UiText *text, s32 arg1, u8 *marks, s32 arg3, s32 arg4) {
    UiFont *font = text->unk_08;
    u16 w;
    u16 h;
    u32 bits;
    s8 i;

    if (marks != 0) {
        bits = (marks[0x16] << 16) | (marks[0x17] << 8) | marks[0x18];
        w = font->unk_1A;
        h = font->unk_1C;
        D_80085027 = 0;
        for (i = 0; i < 0x16; i += 2) {
            ui_menu_secondary(0x61 - marks[i], (marks[i + 1] & 0x3F) + 9, w, h, arg1, arg3, bits & 3);
            bits >>= 2;
        }
        bits = (marks[0x16] << 16) | (marks[0x17] << 8) | marks[0x18];
        D_80085027 = 1;
        for (i = 0; i < 0x16; i += 2) {
            ui_menu_secondary(0x5F - marks[i], (marks[i + 1] & 0x3F) + 7, w, h, arg1, arg3, bits & 3);
            bits >>= 2;
        }
        D_80085027 = 0;
        ui_menu_tertiary(5, 0xE, text, arg1, arg4, arg3, 0xC02F);
    } else {
        D_80085027 = 0;
        ui_menu_tertiary(5, 0x18, text, arg1, arg4, arg3, 0xC02F);
    }
}
