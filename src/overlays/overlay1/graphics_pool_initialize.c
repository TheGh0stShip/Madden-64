#include "types.h"

extern void *D_80078458;
extern s16 D_80088D28;
extern s16 D_800895BC;
extern s16 D_800895C4;
extern void *func_80032E00(s32 value, s32 size);
extern void func_80097120(s32 value);

void graphics_pool_initialize(void)
{
    if (D_80078458 == 0) {
        D_80078458 = func_80032E00(0, 0x100);
    }
    func_80097120(3);
    D_80088D28 = 1;
    D_800895BC = 0x300;
    D_800895C4 = 0x100;
}
