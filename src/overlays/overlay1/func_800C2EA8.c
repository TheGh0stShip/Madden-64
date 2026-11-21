#include "types.h"

void func_8000D834(s32 a, s32 b);
void func_8000D874(s32 a, s32 b);
u16 func_80016FD4(void);
void func_8001AEA8(s32 a);
void func_8002FFEC(void (*cb)(void));
void func_80035F88(u16 id, s32 index);
void func_80036540(s32 a);
void func_800AADA8(s16 a);
void func_800BE644(void);

extern s16 D_80072730[];
extern s32 D_80072754;
extern s32 D_80072758;
extern s32 D_80080C10;
extern s16 D_80080C20;
extern s32 D_800876F8;
extern s32 D_80087A64;
extern s8 D_80087AF2;
extern s32 D_8008931C;
extern s16 D_8008A6A0;
extern s16 D_8008A6A2;
extern s16 D_8008A6C0;
extern u16 D_8008A71C;
extern s32 D_8008AF94;
extern s16 D_8008B33C;

void func_800C2EA8(void) {
    if (D_80080C10 & 0x2000) {
        if (D_80087AF2 == 0) {
            switch (D_80080C20) {
            case 1:
                func_8002FFEC(func_800BE644);
                D_80080C20 = 0;
                break;
            case 2:
                func_80036540(0);
                D_8008A71C &= ~2;
                func_8002FFEC(func_800BE644);
                func_80035F88(func_80016FD4(), D_80072730[D_8008B33C]);
                D_80080C20 = 0;
                break;
            case 3:
                func_80035F88(func_80016FD4(), D_80072730[D_8008B33C]);
                D_80080C20 = 0;
            case 0:
                func_8000D874(D_80087A64, D_8008AF94);
                func_8000D834(D_8008931C, D_8008AF94);
                func_8000D834(D_8008931C, D_80072754);
                func_8000D834(D_8008931C, D_80072758);
                func_8001AEA8(D_800876F8);
                func_800AADA8(D_8008A6A0);
                func_800AADA8(D_8008A6A2);
                func_800AADA8(D_8008A6C0);
                break;
            case 4:
                D_80080C20 = 0;
                func_8002FFEC(func_800BE644);
                break;
            }
            D_8008B33C = -1;
        }
        D_80080C10 &= ~0x12000;
    }
}
