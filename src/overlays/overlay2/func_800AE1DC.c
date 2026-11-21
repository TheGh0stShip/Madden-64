#include "types.h"

typedef struct {
    u8 pad0[0x14];
    s32 unk_14;
} Sub38;

typedef struct {
    u8 pad0[0xC];
    s32 unk_0C;
} Sub24;

typedef struct {
    u8 pad0[0x5];
    u8 unk_05[0xF];
    u8 unk_14;
} Sub60;

typedef struct {
    u8 pad0[0x24];
    Sub24 *unk_24;
    u8 pad28[0x38 - 0x28];
    Sub38 *unk_38;
    s32 unk_3C;
    u8 pad40[0x60 - 0x40];
    Sub60 *unk_60;
} Obj;

u8 func_80092BD0(s32, s32, s32);
u8 func_80092CFC(s32, s32, s32);
void func_800AE460(Obj *);
void func_800AE734(Obj *, u8);
void func_800AE9B4(Obj *);
void func_800AEA88(Obj *);
void func_800AEAFC(Obj *);
void func_800AF0DC(Obj *, u16, s32);
u16 func_800AF1D4(s32);
void func_800AFB8C(Sub38 *, s32, Obj *);
void func_800D63B4(Obj *);
void func_800D6424(s32, s32, s32, s32);
void func_800DB478(s32);
void func_800DF6EC(void);
void func_800DF72C(void);

void func_800AE1DC(Obj *arg0, s32 arg1, s16 arg2) {
    Sub60 *s1 = arg0->unk_60;
    s32 s2 = arg0->unk_24->unk_0C;

    switch (arg2) {
        case 13:
            func_800AFB8C(arg0->unk_38, 0, arg0);
            arg0->unk_38->unk_14 |= 1;
            func_800AF0DC(arg0, func_800AF1D4(s1->unk_14), 7);
            func_800AE460(arg0);
            break;
        case 19:
        case 20:
            func_800AEAFC(arg0);
            func_800AE460(arg0);
            break;
        case 5:
            func_800DF6EC();
            func_800AE734(arg0, func_80092CFC(s1->unk_05[s1->unk_14 * 2], 30, 1));
            func_800AF0DC(arg0, func_800AF1D4(s1->unk_14), 7);
            func_800DB478(s2);
            func_800AE460(arg0);
            break;
        case 4:
            func_800DF6EC();
            func_800AE734(arg0, func_80092BD0(s1->unk_05[s1->unk_14 * 2], 30, 1));
            func_800AF0DC(arg0, func_800AF1D4(s1->unk_14), 7);
            func_800DB478(s2);
            func_800AE460(arg0);
            break;
        case 8:
            func_800DF72C();
            func_800AE9B4(arg0);
            break;
        case 17:
        case 28:
            func_800DF72C();
            func_800AEA88(arg0);
            break;
        case 12:
            func_800D63B4(arg0);
            func_800D6424(arg0->unk_3C, 0x14A, 0, 10);
            break;
    }
}
