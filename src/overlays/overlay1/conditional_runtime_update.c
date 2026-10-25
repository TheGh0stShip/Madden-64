#include "types.h"

extern u32 D_80080C10;
extern s16 D_800894FC;
extern s16 D_800857F0;

extern void func_8009BD60(void);
extern void func_800A0970(void);

void conditional_runtime_update(void)
{
    func_8009BD60();
    if ((D_80080C10 & 0x4000) && D_800894FC == 0 && D_800857F0 == 0) {
        func_800A0970();
    }
}
