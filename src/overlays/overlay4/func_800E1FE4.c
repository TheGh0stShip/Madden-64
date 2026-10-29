#include "types.h"

typedef struct {
    s32 count;
    char *items[7];
    s32 selection;
    s32 scroll;
    s32 flags;
} MenuItems;

typedef struct {
    s16 kind;
    u8 pad02[2];
    MenuItems *items;
    s32 arg;
    u8 pad0C[0x10 - 0xC];
    s16 style;
    u8 pad12[0x18 - 0x12];
} MenuDesc;

extern char D_8006D984[];
extern char D_8006D9A0[];
extern char D_8006D9BC[];
extern char D_8006BFA0[];
extern char D_8006D9D4[];
extern char D_8006D9EC[];
extern char D_8006DA04[];
extern s32 D_80087AA8;
extern s32 D_8006BB68;
extern s32 D_8008931C;
extern void func_8003CE88(s32 arg0, s32 arg1, s32 arg2);
extern s32 func_8000D740(s32 screen, s32 index, MenuDesc *desc);
extern void func_80041620(s32 handle, s32 enable);
extern void func_80041584(s32 handle, s32 enable);
extern void func_80030C74(s32 *buttons);
extern void func_8003E460(void);
extern void func_800B7C80(void);
extern void func_8000D874(s32 screen, s32 layer);
extern void func_8000D834(s32 screen, s32 layer);

void func_800E1FE4(void) {
    MenuDesc desc;
    MenuItems items;
    s32 buttons;
    s32 layer;

    items.count = 10;
    items.items[0] = D_8006D984;
    items.items[1] = D_8006D9A0;
    items.items[2] = D_8006D9BC;
    items.items[3] = D_8006BFA0;
    items.items[4] = D_8006D9D4;
    items.items[5] = D_8006D9EC;
    items.items[6] = D_8006DA04;
    items.selection = 0;
    items.scroll = 0;
    items.flags = 0;
    func_8003CE88(0x28, 0x69, 0x10);
    desc.kind = 8;
    desc.items = &items;
    desc.arg = 0;
    desc.style = 2;
    layer = func_8000D740(D_80087AA8, 1, &desc);
    if (D_8006BB68 != 0) {
        func_80041620(D_8006BB68, 0);
        func_80041584(D_8006BB68, 0);
    }
    goto check;
    do {
        func_8003E460();
        func_800B7C80();
check:
        func_80030C74(&buttons);
    } while (buttons & 2);
    if (D_8006BB68 != 0) {
        func_80041620(D_8006BB68, 1);
        func_80041584(D_8006BB68, 1);
    }
    func_8003CE88(0x28, 0x69, 0x10);
    func_8000D874(D_80087AA8, layer);
    func_8000D834(D_8008931C, layer);
}
