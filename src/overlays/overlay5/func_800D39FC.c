#include "types.h"

typedef struct {
    char c[2];
} Lit2;

extern Lit2 D_80002040;
extern char D_80002064[];

s32 func_800D3DD4(s16, s8 *, s16, s32);
void func_800167FC(s16, u8 *);
void func_8002E688(u8 *, char *);

void func_800D39FC(s16 arg0, s8 *arg1, s16 arg2, u8 *arg3, s32 arg4) {
    s32 value;
    u8 *p;
    s32 whole;
    s16 frac;

    value = func_800D3DD4(arg0, arg1, arg2, arg4);
    switch (*arg1) {
    case 0:
        func_800167FC(value, arg3);
        break;
    case 1:
        func_800167FC(value, arg3);
        func_8002E688(arg3, D_80002064);
        break;
    case 6:
        func_800167FC(100 - value, arg3);
        func_8002E688(arg3, D_80002064);
        break;
    case 2:
    case 5:
        whole = value >> 16;
        if ((value & 0xFFFF8000) == 0x8000) {
            *(Lit2 *)arg3 = D_80002040;
            func_800167FC(whole, arg3 + 1);
        } else {
            func_800167FC(whole, arg3);
        }
        p = arg3;
        while (*p != 0) {
            p++;
        }
        *p++ = '.';
        frac = value;
        if (frac < 0) {
            frac = -frac;
        }
        func_800167FC(frac, p);
        break;
    }
}
