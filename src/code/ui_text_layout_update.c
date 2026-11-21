#include "types.h"

typedef struct UiLayout {
    u8 pad0[0x1A];
    u16 unk1A;
    u16 unk1C;
} UiLayout;

typedef struct UiText {
    u8 pad0[8];
    UiLayout *unk8;
} UiText;

extern s8 D_80085027;

extern void ui_menu_primary(s8 x, s32 y, s8 width, s8 height, s32 arg4, s32 arg5, s32 style);
extern void ui_menu_tertiary(s32 kind, s32 y, UiText *text, s32 arg3, s32 arg4, s32 arg5, s32 flags);

void ui_text_layout_update(UiText *text, s32 arg1, u8 *cells, s32 arg3, s32 arg4) {
    UiLayout *layout;
    u16 width;
    u16 height;
    u32 bits;
    s8 i;

    layout = text->unk8;
    if (cells != 0) {
        bits = (cells[0x16] << 16) | (cells[0x17] << 8) | cells[0x18];
        width = layout->unk1A;
        height = layout->unk1C;
        D_80085027 = 0;
        for (i = 0; i < 0x16; i += 2) {
            ui_menu_primary(cells[i] + 1, (cells[i + 1] & 0x3F) + 9, width, height, arg1, arg3, bits & 3);
            bits >>= 2;
        }
        bits = (cells[0x16] << 16) | (cells[0x17] << 8) | cells[0x18];
        D_80085027 = 1;
        for (i = 0; i < 0x16; i += 2) {
            ui_menu_primary(cells[i] - 1, (cells[i + 1] & 0x3F) + 7, width, height, arg1, arg3, bits & 3);
            bits >>= 2;
        }
        D_80085027 = 0;
        ui_menu_tertiary(5, 0xE, text, arg1, arg4, arg3, 0xC02F);
    } else {
        D_80085027 = 0;
        ui_menu_tertiary(5, 0x18, text, arg1, arg4, arg3, 0xC02F);
    }
}
