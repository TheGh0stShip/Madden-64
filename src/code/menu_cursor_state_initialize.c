#include "types.h"

typedef struct {
    s16 unk_00;
    u8 unk_02[2];
    u8 unk_04[2];
    u16 unk_06;
    u16 unk_08;
    u16 unk_0A;
    u16 unk_0C;
    u8 unk_0E;
    u8 unk_0F;
    u8 unk_10[4];
    u8 unk_14;
    u8 unk_15;
    u8 unk_16;
} MenuCursorState;

extern MenuCursorState D_80088AE4;
extern s32 D_80084F34;
extern s16 D_800876DC;
extern u16 D_80087A60;
extern u16 D_80087AAC;
void func_80033308(s32, void *, s32, s32);

void menu_cursor_state_initialize(void) {
    func_80033308(0, D_80088AE4.unk_04, 0x8C, 0);
    D_80088AE4.unk_0E = 0;
    D_80088AE4.unk_16 = 0;
    D_80088AE4.unk_15 = 0;
    D_80088AE4.unk_06 = D_80088AE4.unk_08 = (u32) D_80084F34 >> 16;
    D_80088AE4.unk_0A = D_80088AE4.unk_0C = D_80087A60 - D_80087AAC + (s16) D_80087A60 * (D_800876DC - 1);
    D_80088AE4.unk_14 = (D_80084F34 >> 20) + 50;
    D_80088AE4.unk_0F = D_80088AE4.unk_00;
}
