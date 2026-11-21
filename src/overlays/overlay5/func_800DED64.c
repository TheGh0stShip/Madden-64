#include "types.h"

#define NULL 0

typedef struct {
    s32 unk_00;
    s16 (*unk_04)(s16);
} Option;

typedef struct {
    u8 unk_00;
    u8 unk_01;
    u8 pad2[2];
    Option *unk_04;
} Spinner;

typedef struct {
    u8 pad0[4];
    u16 unk_04;
    u8 pad6[2];
    Spinner *unk_08;
    s32 (*unk_0C)(void);
} ItemDesc;

typedef struct Item {
    struct Item *unk_00;
    struct Item *unk_04;
    s16 unk_08;
    u8 padA[2];
    ItemDesc *unk_0C;
    u8 unk_10;
} Item;

typedef struct {
    u16 unk_00;
    u8 pad2[0x12];
    ItemDesc *unk_14;
} MenuFlags;

typedef struct {
    u8 pad0[4];
    MenuFlags *unk_04;
    Item *unk_08;
    Item *unk_0C;
    Item *unk_10;
    u8 unk_14;
    u8 pad15[7];
    u8 unk_1C[0x64 - 0x1C];
    s32 unk_64;
} Menu;

typedef struct {
    u8 pad0[0xC];
    Menu *unk_0C;
} Screen;

void func_8000DC08(s32);
void func_8000DC18(s32);
void func_800DB0AC(void *, u8, s32);
void func_800DB2A4(void *);
void func_800DB478(void *);
void func_800DF72C(void);
void overlay5_resource_mode_notify(void);

s16 func_800DED64(Screen *arg0, s16 arg1) {
    Menu *menu = arg0->unk_0C;
    Item *item = menu->unk_0C;
    s32 ret = 0x19;
    Item *it;
    Item *last;
    Item *next;
    Item *tail;
    Spinner *spin;
    s16 (*fn)(s16);

    switch (arg1) {
        case 8:
            if (item->unk_08 == 0) {
                ret = 0x19;
                break;
            }
            if (item->unk_0C->unk_04 & 1) {
                fn = item->unk_0C->unk_08->unk_04[item->unk_0C->unk_08->unk_01].unk_04;
                if (fn != NULL) {
                    fn(arg1);
                }
                ret = 0x19;
                break;
            }
            if (menu->unk_04->unk_00 & 1) {
                menu->unk_04->unk_14 = item->unk_0C;
            }
            if (item->unk_0C->unk_0C != NULL) {
                if (menu->unk_04->unk_00 & 8) {
                    func_800DF72C();
                }
                ret = item->unk_0C->unk_0C();
            }
            break;
        case 0:
            ret = 0x1B;
            last = menu->unk_0C->unk_00;
            if (last != NULL) {
                menu->unk_0C = last;
                if (menu->unk_04->unk_00 & 8) {
                    overlay5_resource_mode_notify();
                }
                break;
            }
            tail = menu->unk_08;
            for (next = tail; next != NULL; next = next->unk_04) {
                tail = next;
            }
            menu->unk_0C = tail;
            func_800DB0AC(menu->unk_1C, tail->unk_10, 0);
            func_800DB478(menu->unk_1C);
            ret = 0x19;
            if ((menu->unk_04->unk_00 & 8) && menu->unk_14 >= 2) {
                overlay5_resource_mode_notify();
            }
            break;
        case 1:
            ret = 0x1B;
            last = menu->unk_0C->unk_04;
            if (last != NULL) {
                menu->unk_0C = last;
                if (menu->unk_04->unk_00 & 8) {
                    overlay5_resource_mode_notify();
                }
                break;
            }
            menu->unk_0C = menu->unk_08;
            func_800DB0AC(menu->unk_1C, menu->unk_0C->unk_10, 0);
            func_800DB478(menu->unk_1C);
            ret = 0x19;
            if ((menu->unk_04->unk_00 & 8) && menu->unk_14 >= 2) {
                overlay5_resource_mode_notify();
            }
            break;
        case 2:
            if (item->unk_0C->unk_04 & 8) {
                ret = 0x19;
            }
            if (item->unk_0C->unk_04 & 0x10) {
                overlay5_resource_mode_notify();
            }
            if (item->unk_08 == 0) {
                ret = 0x19;
                break;
            }
            if (!(item->unk_0C->unk_04 & 1)) {
                break;
            }
            if (item->unk_0C->unk_08->unk_01 != 0) {
                item->unk_0C->unk_08->unk_01--;
            } else {
                item->unk_0C->unk_08->unk_01 = item->unk_0C->unk_08->unk_00 - 1;
            }
            goto changed;
        case 3:
            if (item->unk_0C->unk_04 & 8) {
                ret = 0x19;
            }
            if (item->unk_0C->unk_04 & 0x10) {
                overlay5_resource_mode_notify();
            }
            if (item->unk_08 == 0) {
                ret = 0x19;
                break;
            }
            if (!(item->unk_0C->unk_04 & 1)) {
                break;
            }
            spin = item->unk_0C->unk_08;
            if (spin->unk_01 + 1 < spin->unk_00) {
                spin->unk_01++;
            } else {
                spin->unk_01 = 0;
            }
        changed:
            if (item->unk_0C->unk_04 & 4) {
                fn = item->unk_0C->unk_08->unk_04[item->unk_0C->unk_08->unk_01].unk_04;
                if (fn != NULL) {
                    fn(arg1);
                }
            }
            ret = 0x1A;
            if ((menu->unk_04->unk_00 & 8) && item->unk_0C->unk_08->unk_00 >= 2) {
                overlay5_resource_mode_notify();
            }
            func_800DB2A4(menu->unk_1C);
            break;
        case 10:
            if (menu->unk_64 != 0) {
                func_8000DC08(menu->unk_64);
            }
            if (menu->unk_10 == NULL) {
                it = menu->unk_08;
                func_800DB0AC(menu->unk_1C, it->unk_10, 0);
                for (; it != NULL; it = it->unk_04) {
                    if (menu->unk_04->unk_14 == it->unk_0C) {
                        menu->unk_0C = it;
                        func_800DB0AC(menu->unk_1C, it->unk_10, 0);
                    }
                }
            }
            func_800DB478(menu->unk_1C);
            menu->unk_10 = NULL;
            break;
        case 11:
            if (menu->unk_64 != 0) {
                func_8000DC18(menu->unk_64);
            }
            menu->unk_10 = menu->unk_0C;
            break;
        default:
            ret = 0x17;
            break;
    }
    return ret;
}
