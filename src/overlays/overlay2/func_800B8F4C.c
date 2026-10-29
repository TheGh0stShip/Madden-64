#include "types.h"

typedef struct {
    u8 pad00[0x140];
    s32 unk140;
    u8 pad144[0x10];
    void *unk154;
    void *unk158;
} Menu;

typedef struct {
    u8 pad00[0x60];
    Menu *menu;
} Item;

typedef struct {
    u8 pad00[0x44];
    s32 unk44;
    s32 unk48;
    s32 unk4C;
    s32 unk50;
} Screen;

extern s32 D_80088090;
extern s32 D_8008931C;

Screen *func_800DD634(void);
s32 func_8000C8A0(s32);
void func_8000D874(s32, s32);
void func_8000D834(s32, s32);
void func_800DD788(s32);
void func_800D57CC(void);
void func_80017C24(s32);
void func_80032F3C(s32, void *);
void func_80024E9C(void);

void func_800B8F4C(Item *item) {
    Screen *screen = func_800DD634();
    Menu *menu = item->menu;

    func_8000D874(func_8000C8A0(D_80088090), menu->unk140);
    func_8000D834(D_8008931C, menu->unk140);
    func_800DD788(0x14);
    func_800D57CC();
    screen->unk44 = 0;
    screen->unk4C = 0;
    func_80017C24(screen->unk48);
    func_80017C24(screen->unk50);
    screen->unk48 = 0;
    screen->unk50 = 0;
    func_80032F3C(0, menu->unk154);
    func_80032F3C(0, menu->unk158);
    func_80032F3C(0, menu);
    func_80024E9C();
}
