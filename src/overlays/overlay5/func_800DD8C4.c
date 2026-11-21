#include "types.h"

typedef struct {
    u8 pad_00[0x1C];
    s32 unk_1C;
    s32 unk_20;
} Item;

typedef struct {
    s32 type;
    s32 value;
    s32 unk_08;
} Counter;

typedef struct {
    s16 id;
    Counter *counter;
    s32 unk_08;
    s32 unk_0C;
    s16 unk_10;
} Init;

typedef struct {
    Item *item;
    s16 unk_04;
    s8 dir;
    s8 speed;
} Anim;

typedef struct {
    u8 pad_00[0xC];
    s32 unk_0C;
    s32 unk_10;
    s32 unk_14;
    s16 unk_18;
    u8 pad_1A[2];
    u16 flags;
} Settings;

typedef struct {
    u8 pad_00[4];
    Settings *settings;
    u8 pad_08[0x10];
    Counter c1;
    Counter c2;
    u8 pad_30[0x40];
    s32 unk_70;
    u8 pad_74[4];
    Item *item_78;
    Item *item_7C;
    Item *item_80;
    Item *item_84;
    Item *item_88;
    u8 pad_8C[4];
    s32 unk_90;
    Item *item_94;
    s32 unk_98;
} State;

extern State *D_80072380;

s32 func_80094A20(s16);
Item *func_8000D740(s32, s32, Init *);
void func_8001EC20(Item *, s32);
s32 func_800E0BB4(Anim *);
void func_800DD694(s32, s32, s32);

void func_800DD8C4(void) {
    Init init;
    Anim anim;
    s32 value;

    if (D_80072380->settings->unk_18 >= 0 && D_80072380->unk_90 == 0) {
        D_80072380->unk_90 = func_80094A20(D_80072380->settings->unk_18);
    }
    value = D_80072380->settings->unk_10;
    if (value != 0) {
        if (D_80072380->item_78 == 0) {
            Item *item;

            D_80072380->c1.type = 2;
            D_80072380->c1.value = D_80072380->settings->unk_10;
            D_80072380->c1.unk_08 = 0;
            init.id = 0x38;
            init.unk_10 = 3;
            init.counter = &D_80072380->c1;
            init.unk_08 = 0;
            item = func_8000D740(D_80072380->unk_70, 1, &init);
            D_80072380->item_78 = item;
            anim.item = item;
            anim.unk_04 = 0;
            anim.speed = 10;
            if (D_80072380->settings->flags & 8) {
                item->unk_1C = -0x145;
                anim.dir = 0;
            } else {
                item->unk_1C = 0x145;
                anim.dir = 1;
            }
            func_800E0BB4(&anim);
        } else if (D_80072380->item_78->unk_1C != 0) {
            Item *item;

            D_80072380->c1.value = value;
            func_8001EC20(D_80072380->item_78, 1);
            item = D_80072380->item_78;
            anim.unk_04 = 0;
            anim.speed = 10;
            anim.item = item;
            if (D_80072380->settings->flags & 8) {
                item->unk_1C = -0x145;
                anim.dir = 0;
            } else {
                item->unk_1C = 0x145;
                anim.dir = 1;
            }
            func_800E0BB4(&anim);
        }
    }
    value = D_80072380->settings->unk_14;
    if (value != 0) {
        if (D_80072380->item_7C == 0) {
            Item *item;

            D_80072380->c2.type = 2;
            D_80072380->c2.value = D_80072380->settings->unk_14;
            D_80072380->c2.unk_08 = 0;
            init.id = 0x38;
            init.unk_10 = 3;
            init.counter = &D_80072380->c2;
            init.unk_08 = 0;
            item = func_8000D740(D_80072380->unk_70, 1, &init);
            D_80072380->item_7C = item;
            anim.item = item;
            item->unk_1C = 0x145;
            anim.dir = 1;
            anim.unk_04 = 0;
            anim.speed = 10;
            func_800E0BB4(&anim);
        } else if (D_80072380->item_7C->unk_1C != 0) {
            Item *item;

            D_80072380->c2.value = value;
            func_8001EC20(D_80072380->item_7C, 1);
            item = D_80072380->item_7C;
            anim.item = item;
            item->unk_1C = 0x145;
            anim.dir = 1;
            anim.unk_04 = 0;
            anim.speed = 10;
            func_800E0BB4(&anim);
        }
    }
    if (D_80072380->settings->unk_0C != 0 && D_80072380->item_88 == 0) {
        init.id = 0;
        init.unk_10 = 2;
        init.counter = 0;
        init.unk_08 = 0;
        D_80072380->item_88 = func_8000D740(D_80072380->unk_70, 1, &init);
        func_800DD694(0x19, 0xC, 0);
    }
    if (D_80072380->settings->flags & 1) {
        if (D_80072380->item_84 == 0) {
            Item *item;

            init.id = 0x38;
            init.counter = 0;
            init.unk_08 = 0;
            init.unk_10 = 6;
            item = func_8000D740(D_80072380->unk_70, 1, &init);
            D_80072380->item_84 = item;
            anim.item = item;
            item->unk_1C = 0x145;
            anim.dir = 1;
            anim.unk_04 = 0;
            anim.speed = 10;
            func_800DD694(0x19, 0xE, 5);
            D_80072380->unk_98 = func_800E0BB4(&anim);
        } else if (D_80072380->item_84->unk_1C != 0) {
            Item *item = D_80072380->item_84;

            anim.item = item;
            item->unk_1C = 0x145;
            anim.unk_04 = 0;
            anim.dir = 0;
            anim.speed = 10;
            D_80072380->unk_98 = func_800E0BB4(&anim);
        }
    }
    if (D_80072380->settings->flags & 2) {
        if (D_80072380->item_80 == 0) {
            Item *item;

            init.id = 0x8E;
            init.counter = 0;
            init.unk_08 = 0;
            init.unk_10 = 3;
            item = func_8000D740(D_80072380->unk_70, 1, &init);
            D_80072380->item_80 = item;
            anim.item = item;
            anim.unk_04 = 0;
            anim.speed = 10;
            if (D_80072380->settings->flags & 0x10) {
                item->unk_1C = -0x145;
                anim.dir = 0;
            } else {
                item->unk_20 = 0xF5;
                anim.dir = 3;
            }
            func_800DD694(0x8E, 0xD, 0x85);
            func_800E0BB4(&anim);
        } else if (D_80072380->item_80->unk_20 != 0 || D_80072380->item_80->unk_1C != 0) {
            Item *item = D_80072380->item_80;

            anim.item = item;
            anim.unk_04 = 0;
            anim.speed = 10;
            if (D_80072380->settings->flags & 0x10) {
                anim.dir = 0;
            } else {
                anim.dir = 3;
            }
            func_800E0BB4(&anim);
        }
    }
    if (D_80072380->settings->flags & 4) {
        if (D_80072380->item_94 == 0) {
            Item *item;

            init.id = 0x38;
            init.counter = 0;
            init.unk_08 = 0;
            init.unk_10 = 8;
            item = func_8000D740(D_80072380->unk_70, 1, &init);
            D_80072380->item_94 = item;
            anim.item = item;
            item->unk_1C = 0x145;
            anim.dir = 1;
            anim.unk_04 = 0;
            anim.speed = 10;
            func_800E0BB4(&anim);
        } else if (D_80072380->item_94->unk_1C != 0) {
            Item *item = D_80072380->item_94;

            anim.item = item;
            item->unk_1C = 0x145;
            anim.unk_04 = 0;
            anim.dir = 0;
            anim.speed = 10;
            func_800E0BB4(&anim);
        }
    }
}
