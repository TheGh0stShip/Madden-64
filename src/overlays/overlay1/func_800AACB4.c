#include "types.h"

typedef struct {
    u8 pad0[0x4];
    s16 unk_4;
    u8 pad6[0x2];
    s16 unk_8;
    s16 unk_A;
    void *unk_C;
    u8 pad10[0x74];
    u16 unk_84;
} Obj;

typedef struct {
    u8 pad0[0x14];
    s32 unk_14;
} Flags;

typedef struct {
    Flags *unk_0;
    s32 unk_4;
} Entry;

void func_8004519C(void);
void func_800451C8(void);
void func_800A3004(Obj *, s32, s32, s32);
extern u8 D_8007A0B0;
extern void *D_80086178;
extern Flags *D_80086C88;
extern Entry D_80086DEC[];
extern s16 D_8008B258;

void func_800A6590(Obj *arg0, u8 arg1) {
    if (D_8007A0B0 == 7) {
        arg0->unk_84 &= ~0x400;
        if (D_80086C88 != 0) {
            D_80086C88->unk_14 |= 1;
        }
        arg0->unk_C = D_80086178;
        func_800451C8();
        D_80086DEC[D_8008B258].unk_0->unk_14 &= ~1;
    }
    D_8007A0B0 = arg1;
    switch (arg1) {
    case 0:
        func_800A3004(arg0, 0, 0, 0);
        arg0->unk_4 = 0;
        arg0->unk_8 = 0;
        break;
    case 1:
        func_800A3004(arg0, 0, 5, 0);
        arg0->unk_4 = 5;
        arg0->unk_8 = 0;
        break;
    case 2:
        func_800A3004(arg0, 0, 1, 0xBFF);
        arg0->unk_4 = 1;
        arg0->unk_8 = 0xBFF;
        break;
    case 3:
        func_800A3004(arg0, 0, 0xB, 0);
        arg0->unk_4 = 0xB;
        arg0->unk_8 = 0;
        break;
    case 4:
        func_800A3004(arg0, 0, 9, 0);
        arg0->unk_4 = 9;
        arg0->unk_8 = 0;
        break;
    case 5:
        func_800A3004(arg0, 0, 0xA, 0);
        arg0->unk_4 = 0xA;
        arg0->unk_8 = 0;
        break;
    case 6:
        func_800A3004(arg0, 0, 2, 0xDFF);
        arg0->unk_4 = 2;
        arg0->unk_8 = 0xDFF;
        break;
    case 7:
        func_800A3004(arg0, 0, 0xD, 0);
        arg0->unk_4 = 0xD;
        arg0->unk_8 = 0;
        func_8004519C();
        break;
    case 8:
        func_800A3004(arg0, 1, 0xE, 0);
        arg0->unk_8 = 0;
        break;
    case 9:
        arg0->unk_A = 8;
        arg0->unk_C = D_80086178;
        func_800A3004(arg0, 0, 1, 0xBFF);
        break;
    }
}
