#include "types.h"

extern u32 D_80074DC0;
extern u32 __osDisableInt(void);
extern void __osRestoreInt(u32 mask);

void __osSetGlobalIntMask(u32 mask) {
    register u32 saveMask = __osDisableInt();

    D_80074DC0 |= mask;
    __osRestoreInt(saveMask);
}
