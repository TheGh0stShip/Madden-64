#include "types.h"

typedef struct { s32 unk0; s32 unk4; } Pair;
typedef struct { s32 unk0; s32 unk4; s32 unk8; s32 unkC; } Vec;
typedef struct { u8 pad0[0x20]; s32 unk20; } Res;
typedef struct { u8 pad0[4]; Res *unk4; u8 pad8; u8 unk9; } Holder;
typedef struct { u8 pad0[8]; s16 unk8; } Info;
typedef struct { u8 pad0[4]; Holder *unk4; u8 pad8[4]; Info *unkC; } Arg0;
typedef struct { u8 pad0; u8 unk1; u8 pad2[2]; Pair *unk4; } Tbl;
typedef struct { u8 pad0[4]; u16 unk4; u8 pad6[2]; Tbl *unk8; s32 unkC; } Arg1;
typedef struct { u8 pad0[0x14]; s32 unk14; u8 pad18[0x20 - 0x18]; s32 unk20; } Arg3;
typedef struct { u8 pad0[0x1C]; s32 unk1C; s32 unk20; } State;

void func_80016FE4(s32);
void func_8001F070(void *, s32, Vec *);
State *func_800DD634(void);
extern s32 D_800892E0[];
extern s32 D_800892F8;

void func_800D5E0C(Arg0 *arg0, Arg1 *arg1, u8 arg2, Arg3 *arg3) {
    Vec p;
    State *s;

    if (arg0->unk4->unk4->unk20 == 0) {
        arg3->unk14 |= 1;
        p.unk4 = arg3->unk20 + 0x10;
        func_8001F070(arg0->unk4->unk4, arg0->unk4->unk9 + arg2, &p);
        arg3->unk20 = p.unk4 - 0x10;
        s = func_800DD634();
        func_80016FE4(D_800892E0[0]);
        func_80016FE4(D_800892E0[1]);
        func_80016FE4(D_800892F8);
        if ((arg1->unk4 & 1) || (arg1->unk4 & 8)) {
            s->unk1C = D_800892E0[0];
            s->unk20 = D_800892E0[1];
        } else {
            s->unk1C = 0;
            s->unk20 = 0;
        }
        if (arg1->unk4 & 1) {
            if (arg1->unk8->unk4[arg1->unk8->unk1].unk4 != 0) {
                s->unk20 = D_800892F8;
            }
        } else if (arg1->unkC != 0) {
            s->unk20 = D_800892F8;
        }
        if (arg0->unkC->unk8 == 0) {
            s->unk1C = 0;
            s->unk20 = 0;
        }
    } else {
        arg3->unk14 &= ~1;
    }
}
