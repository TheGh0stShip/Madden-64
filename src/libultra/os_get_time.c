#include "types.h"

extern s64 D_8007E5A8;
extern u32 D_8007E5B0;
extern u32 __osDisableInt(void);
extern void __osRestoreInt(u32 mask);
extern u32 osGetCount(void);

s64 osGetTime(void) {
    u32 count;
    u32 elapsed;
    s64 accumulated;
    register u32 mask;

    mask = __osDisableInt();
    count = osGetCount();
    elapsed = count - D_8007E5B0;
    accumulated = D_8007E5A8;
    __osRestoreInt(mask);
    return accumulated + elapsed;
}
