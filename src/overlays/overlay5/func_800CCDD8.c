#include "types.h"

typedef struct {
    u8 pad00[0x60];
    s32 *unk_60;
} Unk800CCDD8;

extern s8 D_80084FA8;
extern s8 D_8008B358;
extern u16 D_8007A30C;
extern u8 D_80081602[];
extern char *D_800E6B78[];
u16 func_80022280(u16, u16, u16);
u8 func_80022A88(u16, u16);
char *func_80022A3C(u16, u16);
s32 func_80022AD8(u16, u16);
s16 func_80022B3C(u16, u16, u16);
void func_800167FC(s16, char *);
void func_8002E65C(char *, char *);
void func_8003E850(u16, char *);

void func_800CCDD8(s32 arg0, u32 arg1, char *arg2, Unk800CCDD8 *arg3) {
    s32 id;
    u32 v;
    s32 *list;

    id = func_80022280(D_80084FA8, D_8008B358, D_8007A30C);
    switch (arg1) {
    case 0:
        func_800167FC(func_80022A88(D_80084FA8, id), arg2);
        break;
    case 1:
        func_8002E65C(arg2, func_80022A3C(D_80084FA8, id));
        break;
    case 2:
        list = arg3->unk_60;
        v = D_80081602[D_80084FA8 * 0x214C + id * 3];
        if (v >= 50) {
            v = 49;
        }
        *(s32 *)arg2 = list[v / 5];
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
