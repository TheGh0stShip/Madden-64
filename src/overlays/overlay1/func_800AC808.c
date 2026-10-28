#include "types.h"

typedef struct {
    u8 unk00[0x1C];
    s32 x;
    s32 angle;
} Actor;

extern u16 D_8006B7A8;
extern s16 D_8006B7C2;
extern s32 D_8007A0D0;
extern Actor *D_8007A0FC;
extern Actor *D_8007A100;
extern Actor *D_8007A104;
extern s32 D_8007A108[];
extern s16 D_8007A15C;
extern s16 D_8007A15E;
extern s16 D_8007A168;
extern s32 D_80080C10;
extern s16 D_80087758;
extern volatile u16 D_8008A5B4;

void func_80016FF4(s32);
void func_8001AEA8(s32);
void func_8003190C(s32, Actor *);
void func_8009C99C(void);
s32 func_8009CA08(void);
s32 func_800A82B0(s32, s32);
void func_800A9154(void);
void func_800AAC94(void);

void func_800AC808(void) {
    s32 n;

    D_8007A15E = 1;
    D_8007A15C = 1;
    n = D_8008A5B4;
    if (D_8007A168 != 0) {
        while (n > 0) {
            D_8007A0FC->angle = func_800A82B0(D_8007A0FC->angle, -0x8C);
            D_8007A104->x = func_800A82B0(D_8007A104->x, 0x140);
            n--;
            D_8007A100->angle = func_800A82B0(D_8007A100->angle, 0x8C);
        }
        n = D_8007A0FC->angle + 0x8C;
        n |= D_8007A104->x - 0x140;
        n |= D_8007A100->angle - 0x8C;
        if (n != 0) {
            return;
        }
        func_8003190C(0x1000, D_8007A100);
        func_80016FF4(D_8007A108[0]);
        func_80016FF4(D_8007A108[1]);
        func_80016FF4(D_8007A108[2]);
        func_80016FF4(D_8007A108[3]);
        func_800A9154();
        func_8001AEA8(D_8007A0D0);
        if (D_8006B7A8 != 3) {
            if (D_80087758 != 0 && func_8009CA08() != 0) {
                func_8009C99C();
            }
            if (D_8006B7C2 != 0) {
                D_80080C10 |= 0x200;
            }
        }
        func_800AAC94();
    }
    D_8006B7A8 = 0;
}
