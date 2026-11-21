#include "types.h"

typedef struct {
    s32 unk00;
    s32 unk04;
    s32 unk08;
    s32 unk0C;
    s32 unk10;
    u8 pad14[0x340];
    u32 unk354;
    u32 unk358;
    s32 unk35C;
} Screen;

typedef struct {
    u8 unk0;
    u8 pad1[5];
} Slot;

typedef struct {
    u8 pad00[0x60];
    Screen *screen;
    u8 pad64[0x10];
    u8 unk74[1];
} Menu;

extern u16 D_8008A5B4;
extern Slot D_800C4FC0[];

s32 func_800A1D20(void);
s32 func_800A1DA4(void);
s32 func_800A1E2C(void);
void func_800A10FC(Screen *screen, s32 index);
void func_800A1194(Screen *screen, void *arg1, s32 from, s32 to);
void func_800A1364(Screen *screen, void *arg1);
void func_800A14D8(Screen *screen, void *arg1);
void func_800D6424(s32, s32, s32, s32);
void func_800DF72C(s16);
void func_8009E254(u32);
void func_800A06E4(void);

void func_800A0DA4(Menu *menu, s32 arg1, s16 button) {
    Screen *screen = menu->screen;
    s32 low = (s16)func_800A1D20();
    s32 high = (s16)func_800A1DA4();
    s32 mode = (s16)func_800A1E2C();
    u8 *items = menu->unk74;

    switch (button) {
    case 2:
        if (low < screen->unk354 && mode != 3) {
            func_800A10FC(screen, screen->unk354 - 1);
            func_800A1194(screen, items, screen->unk354, screen->unk354 - 1);
            screen->unk354--;
        }
        break;
    case 3:
        if (screen->unk354 < high && mode != 3) {
            func_800A10FC(screen, screen->unk354 + 1);
            func_800A1194(screen, items, screen->unk354, screen->unk354 + 1);
            screen->unk354++;
        }
        break;
    case 8:
    case 28:
        if (D_800C4FC0[screen->unk354].unk0 != 8) {
            func_800DF72C(mode);
            func_8009E254(screen->unk354);
            func_800A06E4();
        }
        break;
    case 12:
        func_800D6424(screen->unk00, 0xF0, 2, 0xA);
        func_800D6424(screen->unk04, 0xF0, 2, 0xA);
        func_800D6424(screen->unk08, 0xF0, 2, 0xA);
        func_800D6424(screen->unk0C, 0xF0, 2, 0xA);
        func_800D6424(screen->unk10, 0xF0, 2, 0xA);
        break;
    }
    screen->unk358 = D_8008A5B4 + screen->unk358;
    if (screen->unk358 >= 30) {
        if (screen->unk35C == 0) {
            func_800A1364(screen, items);
        } else if (screen->unk35C == 1) {
            func_800A14D8(screen, items);
        }
    }
}
