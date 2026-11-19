#include "m2c.h"

typedef struct { u8 pad[0x1C]; s32 unk1C; s32 unk20; s32 rect[4]; } Disp;
typedef struct { s32 word[76]; } Sub;
typedef struct { u8 pad[0x2C]; s32 unk2C; s32 unk30; s32 unk34; u8 pad2[0x28]; u32 unk60; u8 pad3[0x10]; Sub sub; } Panel;
typedef struct { s16 x, y; } Pair;
typedef struct { char names[8][0xB]; s16 a[8]; s16 b[8]; s16 c[8]; s16 d[8]; Pair p1[8]; Pair p2[8]; } Stats;
extern char D_8006BE4C[];
extern Stats D_80088118;
extern s32 D_800892D8[4];
extern s32 D_800892F0[2];
extern s32 D_800E5FCC;
extern s32 D_800E7A58;
Disp *func_800DD634(void);
u32 func_800D2FF8(void);
void func_80016FE4(s32);
void func_80016FF4(s32);
void func_800D6060(s32, s32 *, Panel *);
void func_800D2D94(Sub *);
void func_800D2830(Panel *arg0) {
    Sub *sub;
    Disp *d;
    s8 i;

    func_800DD634();
    sub = &arg0->sub;
    D_800E7A58 = 0;
    for (i = 1; i < 0x4B; i++) {
        sub->word[i] = 0;
    }
    sub->word[0] = 0x4C;
    d = func_800DD634();
    d->unk1C = D_800892F0[0];
    d->unk20 = D_800892F0[1];
    d->rect[0] = D_800892D8[0];
    d->rect[1] = D_800892D8[1];
    d->rect[2] = D_800892D8[2];
    d->rect[3] = D_800892D8[3];
    arg0->unk60 = func_800D2FF8();
    if (arg0->unk60 >= 2) {
        func_80016FE4(D_800892F0[0]);
        func_80016FE4(D_800892F0[1]);
    } else {
        func_80016FF4(D_800892F0[0]);
        func_80016FF4(D_800892F0[1]);
    }
    if (arg0->unk60 == 0) {
        sub->word[71] = (s32) D_8006BE4C;
        D_800E7A58 = 7;
    } else {
        D_800E7A58 = 0;
        while (1) {
            if (D_80088118.d[D_800E7A58] != -1) {
                break;
            }
            D_800E7A58++;
        }
        sub->word[71] = (s32) D_80088118.names[D_800E7A58];
    }
    arg0->unk34 = 0x400;
    arg0->unk2C = 0;
    arg0->unk30 = 0xFA;
    func_800D6060(0xF8, &D_800E5FCC, arg0);
    func_800D2D94(sub);
}
