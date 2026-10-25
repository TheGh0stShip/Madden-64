#include "types.h"

extern s16 D_80089320;
extern u32 D_80080C10;
extern u8 D_80087AB0;
extern s8 D_80085BFA;
extern void func_800C5F80(void);

void status_overlay_enable(void)
{
    if (D_80089320 != 0) {
        D_80087AB0 = 0x1C;
        D_80080C10 |= 0x200;
        func_800C5F80();
    }
    D_80085BFA = 0;
}
