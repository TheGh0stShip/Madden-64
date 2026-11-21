#include "types.h"

typedef struct {
    u8 pad0[0xCC];
    char *unk_CC;
} Screen;

extern u16 D_800C502C;
extern char D_800C03AB[];
extern char D_800C03B0[];
extern char D_800C03CC[];
extern char D_800C03E4[];
extern s8 D_800C4AD2;

void func_800167FC(s16, char *);
void func_8001EC20(s32, s32);

void func_8009CCA4(s32 arg0, s32 arg1, u32 arg2, Screen *arg3) {
    char *text;

    switch (arg2) {
    case 0:
    case 1:
    case 2:
        text = D_800C03AB;
        func_800167FC(D_800C502C + 1, text);
        arg3->unk_CC = text - 0x13;
        break;
    case 3:
        if (D_800C4AD2 == 4) {
            arg3->unk_CC = D_800C03CC;
        } else {
            arg3->unk_CC = D_800C03B0;
        }
        break;
    case 4:
        if (D_800C4AD2 != 4) {
            arg3->unk_CC = D_800C03CC;
            break;
        }
    case 5:
        arg3->unk_CC = D_800C03E4;
        break;
    }
    if (arg0 != 0) {
        func_8001EC20(arg0, arg1);
    }
}
