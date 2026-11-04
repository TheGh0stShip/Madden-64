#include "types.h"

extern s32 D_80080C10;
extern u16 D_80080C20;

extern void func_80030110(void);
extern void func_80030050(void);
extern void func_8000BF08(void);

void func_800C30A4(void) {
    if (D_80080C10 & 0x2000) {
        goto check;
        do {
            func_80030110();
            func_80030050();
            func_8000BF08();
        check:;
        } while ((u32)(D_80080C20 - 1) < 2);
    }
}
