#include "types.h"

typedef struct {
    s32 unk_00;
    u8 pad04[4];
    s32 unk_08;
    u8 pad0C[0x68];
    s32 unk_74[1];
} Menu;

extern u8 D_8008C10C[];
extern u8 D_800BDEEC[];
extern s8 D_800BDEFC[];
void func_800167FC(s32, s32);
void func_8001EC20(s32, s32);
void func_8001ECAC(s32, s32, s32);
void func_8002E688(s32, u8 *);
void func_80036CD4(s8);
s8 func_80036CFC(void);

void func_800B3700(u8 mode, u8 value, void *arg2, u8 slot)
{
    s32 refresh = 0;
    s32 apply = 0;
    Menu *menu = arg2;
    s8 id;
    u8 index;
    s32 *list;

    id = func_80036CFC();
    index = D_800BDEEC[(u8)id];
    switch (mode) {
    case 0:
        apply = 1;
        refresh = 1;
        if (index < 5) {
            index++;
        } else {
            index = 0;
        }
        id = D_800BDEFC[index];
        break;
    case 1:
        apply = 1;
        refresh = 1;
        if (index != 0) {
            index--;
        } else {
            index = 5;
        }
        id = D_800BDEFC[index];
        break;
    case 2:
        apply = 1;
        index = value;
        id = D_800BDEFC[index];
        break;
    case 3:
        refresh = 1;
        break;
    case 4:
        menu->unk_00 = index;
        break;
    case 5:
        func_8001ECAC(menu->unk_08, slot, 6);
        break;
    case 6:
        func_8001ECAC(menu->unk_08, slot, 0);
        break;
    }
    if (apply == 1) {
        func_80036CD4(id);
    }
    if (refresh == 1) {
        list = menu->unk_74;
        func_800167FC(index * 20, list[slot]);
        func_8002E688(list[slot], D_8008C10C);
        func_8001EC20(menu->unk_08, slot);
    }
}
