#include "types.h"

typedef struct {
    u8 pad_000[0x140];
    s32 unk_140;
    u8 pad_144[8];
    u8 unk_14C;
} WeekMenu;

typedef struct {
    u8 pad_00[0x60];
    WeekMenu *unk_60;
} WeekOwner;

typedef struct {
    s8 v;
} S8;

extern S8 D_800C509C;
extern u8 D_800BF394[];
extern u8 D_800BF3B4[];

void func_800DF6EC(void);
void func_800DD514(void *);
void func_800DE84C(void *);
void func_800B9010(WeekMenu *);
void func_800B9280(WeekMenu *);
void func_800B93F4(WeekMenu *, WeekOwner *);
void func_8001EC20(s32, s32);

void func_800B9590(WeekOwner *owner, u8 up) {
    WeekMenu *menu = owner->unk_60;
    u8 all;
    u8 last;
    u32 i;

    if (D_800C509C.v < 2) {
        return;
    }
    func_800DF6EC();
    all = D_800C509C.v >= 20;
    last = 16;
    if (D_800C509C.v - 1 < 16) {
        last = D_800C509C.v - 1;
    }
    if (!up) {
        if (menu->unk_14C == 0) {
            if (all == 1) {
                menu->unk_14C = 19;
            } else {
                menu->unk_14C = last;
            }
        } else {
            menu->unk_14C--;
        }
    } else {
        if (menu->unk_14C == last) {
            if (all == 1) {
                menu->unk_14C = 19;
            } else {
                menu->unk_14C = 0;
            }
        } else {
            menu->unk_14C++;
        }
    }
    if (menu->unk_14C == 19) {
        func_800DD514(D_800BF3B4);
        func_800DE84C(D_800BF394);
        return;
    }
    func_800B9010(menu);
    func_800B9280(menu);
    func_800B93F4(menu, owner);
    for (i = 0; i < 3; i++) {
        func_8001EC20(menu->unk_140, i + 2);
        func_8001EC20(menu->unk_140, i + 6);
    }
    func_8001EC20(menu->unk_140, 1);
    func_8001EC20(menu->unk_140, 5);
}
