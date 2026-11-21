#include "types.h"

typedef struct {
    s32 unk_0;
    s16 unk_4;
    s16 unk_6;
    s16 unk_8;
    s32 unk_C;
    s32 unk_10;
    u8 unk_14[0x14];
} Unk8000D8DCArgs;

typedef struct {
    s32 unk_0;
    s32 unk_4;
} Unk800892E8;

typedef struct {
    u8 unk_00[0x14];
    s32 unk_14;
    s32 unk_18;
} Unk800DD634;

typedef struct {
    u8 unk_00[0x2C];
    s32 unk_2C;
    s32 unk_30;
    s32 unk_34;
    u8 unk_38[0x3C];
    s32 unk_74[90];
} Unk800A9E20;

extern u16 D_80084F40;
extern Unk800892E8 D_800892E8;
extern u8 D_800BF2CC[];
extern s8 D_800BF584[];
extern u8 D_800C0400[];
extern s32 D_800C3A10;
extern s16 D_800C3A1C;
extern s16 D_800C5018;
extern s16 D_800C502C;
extern s32 D_800C504C;
extern s8 D_800C509C;
extern s16 D_800C5CEA;

s32 func_8000D8DC(s32, Unk8000D8DCArgs *);
void func_80016FC4(u16);
s16 func_80016FD4(void);
void func_80016FE4(s32);
void func_8008DA98(void);
s8 func_8008EF54(s16);
void func_800AA6EC(void);
void func_800D6060(s32, s8 *, Unk800A9E20 *);
Unk800DD634 *func_800DD634(void);

void func_800A9E20(Unk800A9E20 *object)
{
    Unk8000D8DCArgs args;
    Unk800DD634 *state;
    s32 *list;
    s8 i;
    Unk800A9E20 *arg0;

    state = func_800DD634();
    D_800C3A1C = func_80016FD4();
    arg0 = object;
    list = arg0->unk_74;
    func_80016FC4(D_80084F40);
    args.unk_4 = 4;
    args.unk_6 = 0;
    args.unk_8 = 0;
    args.unk_10 = 0;
    args.unk_C = 0x10;
    args.unk_0 = 0;
    D_800C504C = func_8000D8DC(0, &args);
    func_80016FE4(D_800C504C);
    args.unk_C = 0x10;
    args.unk_0 = 1;
    D_800C3A10 = func_8000D8DC(0, &args);
    func_80016FE4(D_800C3A10);
    for (i = 1; i < 90; i++) {
        list[i] = 0;
    }
    func_8008DA98();
    D_800C502C = D_800C509C;
    if (D_800C502C > 16) {
        D_800C5018 = D_800C502C;
    } else {
        D_800C5018 = 16;
    }
    D_800BF584[1] = func_8008EF54(D_800C502C);
    D_800BF584[0] = 5;
    state->unk_14 = D_800892E8.unk_0;
    state->unk_18 = D_800892E8.unk_4;
    list[0] = 90;
    list[51] = (s32)D_800BF2CC;
    list[52] = (s32)D_800C0400;
    func_800AA6EC();
    arg0->unk_34 = 0x298;
    arg0->unk_2C = 0;
    arg0->unk_30 = 0xFA;
    func_800D6060(0x290, D_800BF584, arg0);
    D_800C5CEA = 0;
}
