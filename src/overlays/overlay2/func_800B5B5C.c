#include "types.h"

typedef struct {
    u8 unk_00[0x14];
    s32 unk_14;
} Obj38;

typedef struct {
    u8 unk_00[0xC];
    s32 unk_0C;
} Obj24;

typedef struct {
    u8 unk_00[3];
    u8 unk_03;
} Obj60;

typedef struct {
    u8 unk_00[0x24];
    Obj24 *unk_24;
    u8 unk_28[0x10];
    Obj38 *unk_38;
    s32 unk_3C;
    u8 unk_40[0x20];
    Obj60 *unk_60;
} Obj;

s32 func_80092BD0(s32, s32, s32);
s32 func_80092CFC(s32, s32, s32);
void func_800AF0DC(Obj *, s32, s32);
s32 func_800AF1D4(s32);
void func_800AFB8C(Obj38 *, s32, Obj *);
void func_800B3F38(Obj *);
void func_800B3FA8(Obj *);
void func_800B411C(Obj *);
void func_800B4188(Obj60 *, s32);
void func_800B41D4(Obj60 *);
void func_800B478C(Obj *, u8);
void func_800B5DBC(Obj *);
void func_800D63B4(Obj *);
void func_800D6424(s32, s32, s32, s32);
void func_800DB478(s32);
void func_800DF6EC(void);
void func_800DF72C(void);

void func_800B5B5C(Obj *arg0, s32 arg1, s16 arg2) {
    Obj60 *s1 = arg0->unk_60;
    s32 s2 = arg0->unk_24->unk_0C;

    switch (arg2) {
    case 13:
        func_800AFB8C(arg0->unk_38, 0, arg0);
        arg0->unk_38->unk_14 |= 1;
        break;
    case 19:
    case 20:
        func_800B411C(arg0);
        func_800B5DBC(arg0);
        break;
    case 5:
        func_800DF6EC();
        func_800B478C(arg0, func_80092CFC(s1->unk_03, 0x1E, 1));
        func_800B41D4(s1);
        func_800B4188(s1, 0);
        func_800AF0DC(arg0, (u16) func_800AF1D4(0), 7);
        func_800DB478(s2);
        func_800B5DBC(arg0);
        break;
    case 4:
        func_800DF6EC();
        func_800B478C(arg0, func_80092BD0(s1->unk_03, 0x1E, 1));
        func_800B41D4(s1);
        func_800B4188(s1, 0);
        func_800AF0DC(arg0, (u16) func_800AF1D4(0), 7);
        func_800DB478(s2);
        func_800B5DBC(arg0);
        break;
    case 8:
        func_800DF72C();
        func_800B3F38(arg0);
        break;
    case 17:
    case 28:
        func_800DF72C();
        func_800B3FA8(arg0);
        break;
    case 12:
        func_800D63B4(arg0);
        func_800D6424(arg0->unk_3C, 0x14A, 0, 0xA);
        break;
    }
}
