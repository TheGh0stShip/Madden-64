#include "types.h"

extern s8 D_80085BFA;
extern u32 D_80080C10;
extern u8 D_80087AB0;
extern void func_800C5F80(void);

void status_overlay_disable(u32 value)
{
    if ((u32)D_80085BFA < value) {
        D_80085BFA = value;
    }
    D_80087AB0 = 0x1D;
    D_80080C10 &= ~0x200;
    func_800C5F80();
}
