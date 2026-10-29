#include "types.h"

extern char D_80001AF8[];
extern s8 D_8007A288;
extern char D_8007A2A0[];
extern s8 D_800C0160[];
extern s8 D_800C0161[];
extern u16 D_800C4B5C[][49];
extern u8 D_800C5CE8;

void func_800167FC(s16, char *);
void func_8001EC20(s32, s32);
void func_8002E688(char *, char *);

void func_8009AE80(s32 x, s32 y) {
    s32 i;
    s32 empty;

    empty = 0;
    for (i = D_800C0160[D_800C5CE8]; i < D_800C0161[D_800C5CE8]; i++) {
        empty += D_800C4B5C[D_8007A288][i] == 0xFFFF;
    }
    func_800167FC(empty, D_8007A2A0);
    func_8002E688(D_8007A2A0, D_80001AF8);
    if (x != 0) {
        func_8001EC20(x, y);
    }
}
