#include "m2c.h"

typedef struct { u8 pad[0x14]; s32 rect[4]; } Disp;
typedef struct { s32 pad[5]; s32 unk14; } Item;
typedef struct { s32 count; char *line[181]; } Sub;
typedef struct { u8 pad[0x2C]; s32 unk2C; s32 unk30; s32 unk34; u8 pad2[0x28]; Item *item; u8 pad3[0x10]; Sub sub; } Panel;
typedef struct { s16 id; Sub *sub; s32 unk8; s32 unkC; s16 unk10; } Init;
extern u8 D_80072531[];
extern s32 D_80088090;
extern s32 D_800892D8[4];
typedef struct { u8 pad[3]; u8 unk3; } Opt;
extern Opt D_800C4EE8;
Disp *func_800DD634(void);
s32 func_8000C8A0(s32);
Item *func_8000D740(s32, s32, Init *);
void func_800D6060(s32, u8 *, Panel *);
void func_8009E3EC(Panel *arg0) {
    Init init;
    Disp *d;
    Sub *sub;
    Item *item;
    u16 i;
    s32 id;
    u8 *p;

    d = func_800DD634();
    sub = &arg0->sub;
    sub->count = 0xB5;
    for (i = 0; i < 0xB4; i++) {
        sub->line[i] = 0;
    }
    sub->line[i] = 0;
    d->rect[2] = D_800892D8[2];
    d->rect[3] = D_800892D8[3];
    d->rect[0] = D_800892D8[0];
    d->rect[1] = D_800892D8[1];
    init.unk10 = 1;
    init.sub = 0;
    init.unk8 = 0;
    init.id = 0x5A0;
    item = func_8000D740(func_8000C8A0(D_80088090), 1, &init);
    item->unk14 &= ~1;
    arg0->item = item;
    arg0->unk2C = 0;
    arg0->unk30 = 0xFA;
    p = D_80072531;
    *p = D_800C4EE8.unk3;
    if ((s8) D_800C4EE8.unk3 == 8) {
        arg0->unk34 = 0x588;
        id = 0x580;
    } else {
        arg0->unk34 = 0x598;
        id = 0x590;
    }
    func_800D6060(id, p - 1, arg0);
}
