#include "types.h"

typedef struct {
    u8 pad0[0x14];
    s32 unk_14;
    u8 pad18[0x4];
    s32 unk_1C;
    s32 unk_20;
    s32 unk_24;
} Obj;

void func_8000BE80(void);
void func_8000D998(s32, Obj *);
void func_8000EC6C(Obj *, s32 *);
void func_8000ED04(Obj *, s32 *);
void func_80035F88(u16, u16);
void func_8003D0C4(s32);
s16 func_8003D8C0(s32);
void func_800A365C(s32);
extern u16 D_80069BA8;
extern u16 D_80069BAA;
extern Obj *D_80080834[];
extern s32 D_80085298;
extern u8 D_80085C00[];
extern s8 D_80087B50;
extern s32 D_80087FA4[];
extern s32 D_80087FB4[];
extern s32 D_80087FB8[];
extern s32 D_80087FBC[];
extern s16 D_80087FDC;
extern s16 D_80087FDE;
extern s16 D_80087FE0;
extern s16 D_80087FE2;
extern u8 D_80088110[];
extern s8 D_8008B790[];

void func_800A22FC(void) {
    if (D_80087FA4[0] != 8) {
        D_80080834[0]->unk_14 &= ~1;
        D_80087FB4[0] = D_80080834[0]->unk_1C;
        D_80087FB8[0] = D_80080834[0]->unk_20;
        D_80087FBC[0] = D_80080834[0]->unk_24;
        func_8000EC6C(D_80080834[0], &D_80087FA4[12]);
        func_8000ED04(D_80080834[0], &D_80087FA4[8]);
        D_80087FDC = 0;
        if (func_8003D8C0(0x40) != 0) {
            D_80087FDC = 1;
            if (D_80087B50 >= 0) {
                D_80087FDE = D_8008B790[D_80087B50];
                D_80087FE0 = D_80085C00[D_80087B50];
                D_80087FE2 = D_80088110[D_80087B50];
            }
            func_8003D0C4(0x40);
        }
        func_8000BE80();
        func_8000D998(D_80085298, D_80080834[0]);
        func_80035F88(D_80069BA8, D_80069BAA);
        func_800A365C(1);
    }
}
