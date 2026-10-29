#include "types.h"

typedef struct {
    u8 pad00[0xA0];
    s32 handle;
} Menu;

typedef struct {
    u8 pad00[0x60];
    Menu *menu;
} Item;

extern u8 D_800BDF0E;
extern u8 D_800BF394[];
extern u8 D_800BF3B4[];

void func_800D6424(s32, s32, s32, s32);
void func_800DD4B8(void);
void func_800DD514(void *);
void func_800DE84C(void *);
void func_800DF6EC(void);
void func_800DF72C(void);

/* Menu key handler: keys 2/3 pick the mode (0x10 / 0) and refresh, 8/28 close, 12 plays a cue. */
void func_800B9830(Item *item, s32 unused, s16 key) {
    Menu *menu = item->menu;

    switch (key) {
        case 12:
            func_800D6424(menu->handle, 0xFA, 2, 0xA);
            break;
        case 2:
            func_800DF6EC();
            D_800BDF0E = 0x10;
            func_800DD514(D_800BF394);
            func_800DE84C(D_800BF3B4);
            break;
        case 3:
            func_800DF6EC();
            D_800BDF0E = 0;
            func_800DD514(D_800BF394);
            func_800DE84C(D_800BF3B4);
            break;
        case 8:
        case 28:
            func_800DF72C();
            func_800DD4B8();
            break;
    }
}
