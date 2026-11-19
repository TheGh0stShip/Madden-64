#include "m2c.h"

typedef struct { u8 pad[0x44]; s32 unk44; s32 unk48; s32 unk4C; s32 unk50; } Disp;
typedef struct { s32 pad[7]; s32 unk1C; s32 unk20; } Item;
typedef struct { s32 count; char *line[181]; } Sub;
typedef struct { char a[3][0x28]; char b[3][0x28]; char c[0x14]; char e[0x14]; char g[0x28]; Item *item; Disp *d; Sub *sub; u8 week; s32 unk150; void *p154; void *p158; } Data;
typedef struct { u8 pad[0x60]; Data *data; u8 pad3[0x10]; Sub sub; } Panel;
typedef struct { s16 id; Sub *sub; s32 unk8; s32 unkC; s16 unk10; } Init;
extern s32 D_80088090;
extern u8 D_800BDF0E;
typedef struct { s8 v; } S8;
extern S8 D_800C509C;
void func_80024694(void);
Disp *func_800DD634(void);
void *func_80032E00(s32, s32);
s32 func_8000C8A0(s32);
Item *func_8000D740(s32, s32, Init *);
void func_800B9010(Data *);
void func_800B9280(Data *);
void func_800DD694(s32, s32, s32);
void func_800D54E4(s32);
void func_800B93F4(Data *, Panel *);
void func_800D6424(Item *, s32, s32, s32);
void func_800B8CC8(Panel *arg0) {
    Init init;
    Sub *sub;
    Disp *d;
    Data *data;
    u32 i;

    func_80024694();
    sub = &arg0->sub;
    d = func_800DD634();
    arg0->sub.count = 0xB5;
    for (i = 0; i < 0xB4; i++) {
        sub->line[i] = 0;
    }
    sub->line[i] = 0;
    data = func_80032E00(0, 0x15C);
    data->p154 = func_80032E00(0, 0x28);
    data->p158 = func_80032E00(0, 0x28);
    arg0->data = data;
    data->d = d;
    data->sub = sub;
    if (D_800C509C.v >= 0x14) {
        data->week = D_800BDF0E;
    } else {
        data->week = D_800C509C.v - 1;
        if (data->week >= 0x11) {
            data->week = 0x10;
        }
    }
    sub->line[0] = data->c;
    sub->line[4] = data->e;
    sub->line[8] = data->g;
    for (i = 0; i < 3; i++) {
        sub->line[1 + i] = data->b[i];
        sub->line[5 + i] = data->a[i];
    }
    init.id = 0x2D0;
    init.sub = &arg0->sub;
    init.unk8 = 0;
    init.unk10 = 7;
    data->item = func_8000D740(func_8000C8A0(D_80088090), 1, &init);
    func_800B9010(data);
    func_800B9280(data);
    func_800DD694(0x6D, 0x14, 4);
    d->unk44 = 0;
    d->unk4C = 0;
    func_800D54E4(2);
    d->unk50 = 0;
    d->unk48 = 0;
    func_800B93F4(data, arg0);
    data->item->unk1C = 0;
    data->item->unk20 = 0xFA;
    func_800D6424(data->item, 0, 3, 0xA);
}
