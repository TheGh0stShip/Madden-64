#include "types.h"

typedef struct {
    u8 unk_00[0x60];
    s32 *unk_60;
} Unk800CCB94_Arg;

extern s16 D_8007A314[];
extern u8 D_80081602[];
extern s8 D_80084FA8;
extern s32 D_800E6B78[];
void func_800167FC(s16, s32 *);
s32 func_80022A3C(u16, u16);
u8 func_80022A88(u16, u16);
s32 func_80022AD8(u16, u16);
s16 func_80022B3C(u16, u16, u16);
void func_8002E65C(s32 *, s32);
void func_8003E850(u16, s32 *);

void func_800CCB94(u16 arg0, u32 arg1, s32 *arg2, Unk800CCB94_Arg *arg3) {
    s32 id = D_8007A314[arg0];
    u32 v;
    s32 *tbl;

    switch (arg1) {
    case 0:
        func_800167FC(func_80022A88(D_80084FA8, id), arg2);
        break;
    case 1:
        func_8002E65C(arg2, func_80022A3C(D_80084FA8, id));
        break;
    case 2:
        v = D_80081602[D_80084FA8 * 0x214C + id * 3];
        tbl = arg3->unk_60;
        if (v >= 50) {
            v = 49;
        }
        *arg2 = tbl[v / 5];
        break;
    case 3:
        func_8002E65C(arg2, D_800E6B78[func_80022AD8(D_80084FA8, id) & 0x3F]);
        break;
    case 4:
        func_800167FC(func_80022B3C(D_80084FA8, id, 0), arg2);
        break;
    case 5:
        func_8003E850(func_80022B3C(D_80084FA8, id, 1), arg2);
        break;
    default:
        func_800167FC((u16)func_80022B3C(D_80084FA8, id, arg1 - 4) * 100 / 253, arg2);
        break;
    }
}
