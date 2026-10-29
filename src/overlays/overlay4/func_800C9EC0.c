#include "types.h"

extern u8 D_80087AB0;
extern s16 D_80088AE4;
extern void func_800C5F80(void);
extern void func_8009CA5C(s32, s32);
extern void func_80041DD4(s32, s32, s32);

void func_800C9EC0(void) {
    D_80087AB0 = 0x10;
    func_800C5F80();
    func_8009CA5C(0x2D, 0xD2);
    if (D_80088AE4 != 0) {
        func_80041DD4(0x3A, 0xE, 0x78);
    }
}
