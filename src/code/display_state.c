#include "types.h"

extern u8 D_80064BB4;
extern void func_8000AFA8(u32 mask);
extern void func_8000B008(u32 mask);

void func_8000E3C8(void) {
    D_80064BB4 = 1;
    func_8000AFA8(0x20004);
}

void func_8000E3F8(void) {
    D_80064BB4 = 0;
    func_8000B008(0x20004);
}
