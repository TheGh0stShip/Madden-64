#include "types.h"

typedef struct Overlay5ResourceMenu {
    void *first;
    void *second;
    void *unused08;
    void *third;
    void *fourth;
    void *unused14;
    s32 enabled;
} Overlay5ResourceMenu;

extern u8 FIRST;
extern u8 SECOND;
extern u8 THIRD;
extern u8 FOURTH;
extern s16 STATE;
void func_80011AF4(void);
void func_800D67B8(s32 *records);
s16 func_800D6454(Overlay5ResourceMenu *menu);
void func_800DD514(void *resource);

s32 overlay5_resource_menu_initialize(void) {
    Overlay5ResourceMenu menu;

    func_80011AF4();
    func_800D67B8((s32 *)&menu);
    menu.first = &FIRST;
    menu.second = &SECOND;
    menu.third = &THIRD;
    menu.fourth = &FOURTH;
    menu.enabled = 1;
    if (func_800D6454(&menu) == 0) {
        STATE = 7;
        func_800DD514(0);
    }
    return 25;
}
