#include "types.h"

typedef struct {
    u8 pad000[0x140];
    s32 handle;
} Menu;

typedef struct {
    u8 pad00[0x60];
    Menu *menu;
} Item;

void func_800B9590(Item *, s32);
void func_800D6424(s32, s32, s32, s32);
void func_800DD4B8(void);
void func_800DF72C(void);

/* Menu key handler: dispatches the item's action for keys 2, 3, 8/28 and 12. */
void func_800B8EB8(Item *item, s32 unused, s16 key) {
    Menu *menu = item->menu;

    switch (key) {
        case 12:
            func_800D6424(menu->handle, 0xFA, 2, 0xA);
            break;
        case 2:
            func_800B9590(item, 0);
            break;
        case 3:
            func_800B9590(item, 1);
            break;
        case 8:
        case 28:
            func_800DF72C();
            func_800DD4B8();
            break;
    }
}
