#include "types.h"

typedef struct {
    u8 pad0[0xC];
    s32 unk_C;
    u32 unk_10;
} Menu;

void func_8003CE88(s32, s32, s32);
void func_800E0500(Menu *, u32, s32);
void func_800E0744(void);

void func_800E0388(s32 buttons, Menu *menu, s32 arg2) {
    u32 sel = menu->unk_10;
    s32 state;

    if (buttons & 2) {
        func_800E0744();
        return;
    }
    state = menu->unk_C;
    if (state != 1 && state != 4) {
        if (buttons & 0x8000) {
            func_8003CE88(0x28, 0x69, 0x10);
            if (menu->unk_C == 0) {
                menu->unk_C = 1;
            } else if (menu->unk_C == 2) {
                menu->unk_C = 3;
            } else if (menu->unk_C == 3) {
                menu->unk_C = 4;
            }
        } else if (buttons & 0xC00) {
            if (state != 2) {
                if (sel == 4 && (buttons & 0x400)) {
                    menu->unk_10 = 5;
                    func_8003CE88(0x27, 0x69, 0x10);
                } else if (sel == 5 && (buttons & 0x800)) {
                    menu->unk_10 = 4;
                    func_8003CE88(0x27, 0x69, 0x10);
                }
            } else {
                func_8003CE88(0x27, 0x69, 0x10);
                if (buttons & 0x800) {
                    if (sel == 0) {
                        menu->unk_10 = 3;
                    } else {
                        menu->unk_10 = sel - 1;
                    }
                } else {
                    menu->unk_10 = sel + 1;
                    if (sel + 1 >= 4) {
                        menu->unk_10 = 0;
                    }
                }
            }
            func_800E0500(menu, menu->unk_10, arg2);
        }
    }
}
