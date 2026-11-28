#include "types.h"

typedef struct {
    void *unk_00;
    void *unk_04;
    void *unk_08;
    void *unk_0C;
    void *unk_10;
    s32 unk_14;
    s32 unk_18;
    u8 unk_1C[4];
} MessageBox;
typedef struct { u8 data[8]; } Name8;

extern void func_800D67B8(MessageBox *box);
extern s16 func_800D6454(MessageBox *box);
extern u16 func_80028224(void);
extern void func_80024F5C(void);
extern void func_80024EDC(s32);
extern void func_8002E688(u8 *, u8 *);
extern void func_800DD514(u8 *);
extern u16 D_800C4EE8;
extern u16 D_800C5098;
extern u16 D_800C4AD0;
extern s8 D_800C4AD2;
extern s8 D_800C4AD3;
extern u8 D_800C5D44;
extern u8 D_800C0FC0[];
extern u8 D_800C0FDC[];
extern u8 D_800C0FF4[];
extern u8 D_800C1008[];
extern u8 D_800C29D4[];
extern u8 D_800C29E0[];
extern u8 D_800C104C[];
extern u8 D_800C1074[];
extern u8 D_800C1080[];
extern u8 D_800C1084[];
extern u8 D_800BFE48[];
extern u8 D_800BFE68[];
extern u8 D_800C4AD4[];
extern u8 D_800C4B3C[];
extern u8 D_800C4B44[];
extern Name8 D_8008B8FC;
extern u8 *D_800C10EC[];

s32 func_800A2C08(void)
{
    MessageBox box;
    s16 answer;
    s16 ok;
    u32 i;
    u8 *name;

    if (D_800C4EE8 == 0x5AA5 || D_800C5098 == 0xA55A || D_800C4AD0 == 0xA5A5) {
        func_800D67B8(&box);
        box.unk_00 = D_800C0FC0;
        if (D_800C4EE8 == 0x5AA5) box.unk_04 = D_800C0FDC;
        else if (D_800C4AD0 == 0xA5A5) box.unk_04 = D_800C1008;
        else box.unk_04 = D_800C0FF4;
        box.unk_0C = D_800C29D4;
        box.unk_10 = D_800C29E0;
        ok = 1;
        box.unk_18 = ok;
        answer = func_800D6454(&box);
        if (answer == 1) goto finish;
        if (answer == -1) goto finish;
    }
    D_800C4AD0 = 0xA5A5;
    D_800C4EE8 = 0;
    D_800C5098 = 0;
    D_800C4AD3 = -1;
    func_800D67B8(&box);
    ok = 1;
    box.unk_00 = D_800C104C;
    box.unk_04 = D_800C1074;
    box.unk_0C = D_800C1080;
    box.unk_10 = D_800C1084;
    box.unk_18 = 0;
    answer = func_800D6454(&box);
    switch (answer) {
    case 0:
        D_800C4AD2 = 4;
        break;
    case 1:
        D_800C4AD2 = 8;
        break;
    default:
        ok = 0;
        break;
    }
    if (ok) {
    if (func_80028224() != 3) func_80024F5C();
    func_80024EDC(4);
    for (i = 0; i < 8; i++) {
        D_800C4B3C[i] = 0;
        D_800C4B44[i] = 15;
        name = D_800C4AD4 + i * 13;
        *(Name8 *)name = D_8008B8FC;
        func_8002E688(name, D_800C10EC[i]);
    }
    D_800C4B3C[0] = 1;
    if (D_800C4AD2 == 4) func_800DD514(D_800BFE48);
    else func_800DD514(D_800BFE68);
    } else {
        D_800C4AD0 = 0;
        D_800C5D44 = 1;
    }
finish:
    return 25;
}
