#include "m2c.h"

typedef struct { u8 pad[0xA]; u16 team; u8 pad2[0x3F]; u8 unk4B; s8 unk4C; } Sel;
typedef struct { u8 pad[0x6C]; u8 unk6C[0x6E]; u8 unkDA[4]; } Info;
extern Info D_80080C90;
extern s32 D_80087784;
extern Sel *D_800895EC;
extern u8 D_800C50BB;
extern s16 D_800C5C36;
s32 func_8003A7B8(u16);
void func_8003A7DC(u16, Info *);
void func_8003A8CC(u16, u8 *);
void func_8003AE80(u8 *, u8 *);
s8 func_8003C1F8(u8 *, u8 *, u8, s32);
s32 func_8008DF68(u16);
s32 func_8008E040(u8);
u8 func_80092BD0(u8, s32, s32);
void func_800BA3FC(void) {
    s32 changed = 0;

    if (D_800C5C36 == 1) {
        if (D_800895EC->team != 0) {
            if (D_800895EC->team == 0xFF) {
                D_800895EC->team = 0x1D;
            } else {
                D_800895EC->team = func_80092BD0(D_800895EC->team, 0x1E, 1);
            }
            changed = 1;
            D_80087784 = func_8003A7B8(D_800895EC->team) + 1;
        } else {
            D_800895EC->team = 0xFF;
        }
    } else {
        if (D_800895EC->team == 0xFF) {
            changed = 1;
            D_800895EC->team = D_800C50BB;
            D_80087784 = func_8008DF68(D_800895EC->team);
        } else if (func_8008E040(D_800895EC->team) == 0) {
            D_800895EC->team = 0xFF;
        } else {
            D_800895EC->team = func_80092BD0(D_800895EC->team, 0x1E, 1);
            changed = 1;
            D_80087784 = func_8008DF68(D_800895EC->team);
        }
    }
    if (changed) {
        func_8003A7DC(D_800895EC->team, &D_80080C90);
        func_8003A8CC(D_800895EC->team, D_80080C90.unk6C);
        func_8003AE80(D_80080C90.unk6C, D_80080C90.unkDA);
        D_800895EC->unk4C = func_8003C1F8(D_80080C90.unk6C, D_80080C90.unkDA, D_800895EC->unk4B, 0);
    }
}
