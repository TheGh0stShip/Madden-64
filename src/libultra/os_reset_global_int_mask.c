#include "types.h"

extern u32 D_80074DC0;
extern u32 __osDisableInt(void);
extern void __osRestoreInt(u32 mask);

void __osResetGlobalIntMask(u32 mask) {
    register u32 saveMask = __osDisableInt();

    D_80074DC0 &= ~(mask & ~0x401);
    __osRestoreInt(saveMask);
}
