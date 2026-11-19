#include "m2c.h"

typedef struct { u8 unk0; u8 pad[9]; u16 team; u8 pad2[0x3F]; u8 unk4B; s8 unk4C; } Sel;
typedef struct { char name[0x6C]; char unk6C[0x6E]; char unkDA[4]; } Info;
extern Info D_80080C90;
extern char *D_80087784;
extern Sel *D_800895EC;
extern char D_800E7820[];
extern s32 D_800E7730;
extern void (*D_80073D50)(s32, s32 *);
void func_8003A7DC(u16, Info *);
void func_8003A8CC(u16, char *);
void func_8003AE80(char *, char *);
s8 func_8003C60C(u8, s32, s32);
void func_8002E65C(char *, char *);
typedef struct { char c[16]; } Lit16;
extern Lit16 D_80002D48;
void func_800B9FF4(void) {
    Lit16 buf = D_80002D48;

    if (D_800895EC->team == 0xFF) {
        if (D_800895EC->unk0 == 0) {
            D_800895EC->unk4C = func_8003C60C(D_800895EC->unk4B, 0, 1);
        }
        func_8002E65C(D_800E7820, buf.c);
        D_80087784 = D_800E7820;
    } else {
        func_8003A7DC(D_800895EC->team, &D_80080C90);
        func_8003A8CC(D_800895EC->team, D_80080C90.unk6C);
        func_8003AE80(D_80080C90.unk6C, D_80080C90.unkDA);
        D_80087784 = D_80080C90.name + 1;
    }
    D_80073D50(3, &D_800E7730);
}
