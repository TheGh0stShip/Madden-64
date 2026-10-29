#include "types.h"

typedef struct {
    u8 pad00[0xA0];
    s32 unkA0;
} Menu;

typedef struct {
    u8 pad00[0x60];
    Menu *menu;
} Item;

typedef struct {
    u8 pad00[0x44];
    s32 unk44;
    u8 pad48[4];
    s32 unk4C;
} Screen;

extern s32 D_80087AA8;
extern s32 D_8008931C;

Screen *func_800DD634(void);
void func_8000D874(s32, s32);
void func_8000D834(s32, s32);
void func_80024E9C(void);
void func_800DD788(s32);
void func_800D57CC(void);
void func_80017C24(s32);
void func_80032F3C(s32, Menu *);

void func_800B98F8(Item *item) {
    Screen *screen = func_800DD634();
    Menu *menu = item->menu;

    func_8000D874(D_80087AA8, menu->unkA0);
    func_8000D834(D_8008931C, menu->unkA0);
    func_80024E9C();
    func_800DD788(0x11);
    func_800D57CC();
    screen->unk44 = 0;
    if (screen->unk4C != 0) {
        func_80017C24(screen->unk4C);
    }
    screen->unk4C = 0;
    func_80032F3C(0, menu);
}
