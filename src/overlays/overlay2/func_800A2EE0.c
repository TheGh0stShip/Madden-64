#include "types.h"

extern s16 D_8006B9E0;
extern s16 D_8006B9E4[];
extern s16 D_80073444;
extern s16 D_800BDF0A;
extern s16 D_800C5C36;
extern u8 D_800BF3D4;

void func_8003A600(s32, s32);
void func_800DD514(void *);

s32 func_800A2EE0(void) {
    s32 i;
    s16 *p;

    if (D_80073444 == 1) {
        func_8003A600(0, 1);
    }
    func_8003A600(1, 0);
    i = 29;
    p = &D_8006B9E4[29];
    D_800BDF0A = 0x16;
    D_800C5C36 = 1;
    D_8006B9E0 = 30;
    do {
        *p = i;
        i--;
        p--;
    } while (i >= 0);
    func_800DD514(&D_800BF3D4);
    return 25;
}
