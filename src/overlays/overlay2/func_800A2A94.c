#include "types.h"

typedef struct {
    void *title;
    void *text;
    s32 unk08;
    void *yes;
    void *no;
    s32 unk14;
    s32 unk18;
    s32 unk1C;
} Dialog;

extern s16 D_80073446;
extern u8 D_800BFE28[];
extern u8 D_800C0FC0[];
extern u8 D_800C0FDC[];
extern u8 D_800C0FF4[];
extern u8 D_800C1008[];
extern u8 D_800C29D4[];
extern u8 D_800C29E0[];
extern u16 D_800C4AD0;
extern u16 D_800C4EE8;
extern u16 D_800C5098;

void func_800D67B8(Dialog *);
s16 func_800D6454(Dialog *);
u16 func_80028224(void);
void func_80024F5C(void);
void func_800DD514(void *);

s32 func_800A2A94(void) {
    Dialog dialog;
    s16 result;

    if (D_800C4EE8 == 0x5AA5 || D_800C5098 == 0xA55A || D_800C4AD0 == 0xA5A5) {
        func_800D67B8(&dialog);
        dialog.title = D_800C0FC0;
        if (D_800C4EE8 == 0x5AA5) {
            dialog.text = D_800C0FDC;
        } else if (D_800C4AD0 == 0xA5A5) {
            dialog.text = D_800C1008;
        } else {
            dialog.text = D_800C0FF4;
        }
        dialog.yes = D_800C29D4;
        dialog.no = D_800C29E0;
        dialog.unk18 = 1;
        result = func_800D6454(&dialog);
        if (result == 1) {
            return 0x19;
        }
        if (result == -1) {
            return 0x19;
        }
    }
    D_80073446 = 0;
    D_800C4EE8 = 0;
    D_800C5098 = 0;
    D_800C4AD0 = 0;
    if (func_80028224() != 3) {
        func_80024F5C();
    }
    func_800DD514(D_800BFE28);
    return 0x19;
}
