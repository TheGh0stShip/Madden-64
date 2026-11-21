#include "types.h"

typedef struct {
    void *unk_00;
    void *unk_04;
    void *unk_08;
    void *unk_0C;
    void *unk_10;
    s32 unk_14;
    s32 unk_18;
    u8 unk_1C[0x04];
} MessageBox;

typedef struct {
    s8 count;
    u8 names[1][13];
} NameList;

extern void func_800D67B8(MessageBox *box);
extern s16 func_800D6454(MessageBox *box);
extern u16 func_80028224(void);
extern void func_80024F5C(void);
extern void func_80024EDC(s32);
extern void func_80011B3C(void);
extern void func_8009E064(void);
extern void func_8002E65C(u8 *dst, u8 *src);
extern void func_800DD514(u8 *);

extern u16 D_800C4EE8;
extern u16 D_800C5098;
extern u16 D_800C4AD0;
extern NameList D_800C4EEB;
extern u8 D_800C5D44;
extern u8 D_800C0FC0[];
extern u8 D_800C0FDC[];
extern u8 D_800C0FF4[];
extern u8 D_800C1008[];
extern u8 D_800C29D4[];
extern u8 D_800C29E0[];
extern u8 D_800C104C[];
extern u8 D_800C1060[];
extern u8 D_800C1084[];
extern u8 D_800C1088[];
extern u16 D_80086190[];
extern u8 D_800724F8;
extern u8 D_800724F9;
extern u8 D_800724FC[];
extern u8 D_80072500[];

s32 func_8009DC58(void)
{
    MessageBox box;
    s16 ok = 1;
    s32 state;
    s16 answer;
    u32 i;

    if (D_800C4EE8 == 0x5AA5 || D_800C5098 == 0xA55A || D_800C4AD0 == 0xA5A5) {
        func_800D67B8(&box);
        box.unk_00 = D_800C0FC0;
        if (D_800C4EE8 == 0x5AA5) {
            box.unk_04 = D_800C0FDC;
        } else if (D_800C4AD0 == 0xA5A5) {
            box.unk_04 = D_800C1008;
        } else {
            box.unk_04 = D_800C0FF4;
        }
        box.unk_0C = D_800C29D4;
        box.unk_10 = D_800C29E0;
        box.unk_18 = 1;
        if (func_800D6454(&box)) {
            ok = 0;
        } else {
            D_800C4EE8 = 0;
            D_800C5098 = 0;
            D_800C4AD0 = 0;
        }
    }
    state = ok;
    if (state == 1) {
        D_800C4EE8 = 0;
        D_800C5098 = 0;
        D_800C4AD0 = 0;
        func_800D67B8(&box);
        box.unk_00 = D_800C104C;
        box.unk_04 = D_800C1060;
        box.unk_0C = D_800C1084;
        box.unk_10 = D_800C1088;
        box.unk_18 = 0;
        answer = func_800D6454(&box);
        switch (answer) {
        case 0:
            D_800C4EEB.count = 8;
            break;
        case 1:
            D_800C4EEB.count = 16;
            break;
        default:
            ok = 0;
            D_800C5D44 = 1;
            break;
        }
        if (ok == 1) {
            if (func_80028224() != 3) {
                func_80024F5C();
            }
            func_80024EDC(2);
            func_80011B3C();
            func_8009E064();
            for (i = 0; i < (u16)D_800C4EEB.count; i++) {
                func_8002E65C(D_800C4EEB.names[i], D_800724FC);
                D_80086190[i] = i;
            }
            D_800724F8 = 0;
            D_800724F9 = 0;
            func_800DD514(D_80072500);
        }
    }
    return 25;
}
