#include "m2c.h"

typedef struct { s32 unk0; char *unk4; u8 pad[0x30]; char *unk38; char *unk3C; } Sub;
typedef struct { s32 pad[2]; s32 unk8; u8 pad2[0x54]; s32 unk60; s32 unk64; s32 unk68; s32 pad3[2]; Sub sub; } Panel;
void func_800167FC(s16, char *);
void func_8001EC20(s32, s32);
void func_8002E65C(char *, char *);
s16 func_800AD984(s32);
s16 func_800E1588(s16);
s16 func_800E1B0C(void);
void func_800E1E40(void);
extern char D_800C3024[];
extern char D_800C3A28[];
extern s16 D_80084F6C;
extern s16 D_800886F6;
extern u16 D_800C4EE8;
extern u16 D_800C5098;
extern u16 D_800C4AD0;
extern char *D_800C2508[];
void func_800ACC64(Panel *arg0) {
    Sub *sub = &arg0->sub;

    if (arg0->unk68 == 1) {
        func_800E1E40();
        arg0->unk68 = 0;
    }
    if (func_800E1588(D_80084F6C) == 0) {
        arg0->unk60 = 1;
        arg0->unk64 = func_800E1B0C();
        arg0->unk68 = 1;
        func_800167FC(D_800886F6, sub->unk38);
        if (D_800C4EE8 == 0x5AA5 || D_800C5098 == 0xA55A || D_800C4AD0 == 0xA5A5) {
            func_800167FC(func_800AD984(1), sub->unk3C);
        } else {
            func_800167FC(func_800AD984(0), sub->unk3C);
        }
        func_8002E65C(D_800C3A28, D_800C2508[D_80084F6C]);
        sub->unk4 = D_800C3A28;
    } else {
        func_8002E65C(D_800C3A28, D_800C2508[D_80084F6C]);
        sub->unk4 = D_800C3A28;
        func_8002E65C(sub->unk38, D_800C3024);
        func_8002E65C(sub->unk3C, D_800C3024);
        arg0->unk64 = 0;
        arg0->unk60 = 0;
    }
    func_8001EC20(arg0->unk8, 0xE);
    func_8001EC20(arg0->unk8, 0xF);
    func_8001EC20(arg0->unk8, 1);
}
