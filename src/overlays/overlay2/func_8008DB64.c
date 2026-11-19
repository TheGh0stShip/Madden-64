#include "m2c.h"

extern char D_80001408[];
extern u16 D_800C4AD0[];
extern u16 D_800C4EE8[];
extern u16 D_800C5098[];
void func_800E2190(char *, u16 *, s32);
void func_8008DB64(void) {
    if (D_800C5098[0] == 0xA55A) {
        func_800E2190(D_80001408, D_800C5098, 1);
    } else if (D_800C4EE8[0] == 0x5AA5) {
        func_800E2190(D_80001408, D_800C4EE8, 1);
    } else if (D_800C4AD0[0] == 0xA5A5) {
        func_800E2190(D_80001408, D_800C4AD0, 1);
    } else {
        func_800E2190(D_80001408, D_800C5098, 1);
    }
}
