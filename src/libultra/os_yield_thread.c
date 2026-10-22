#include "os_internal.h"

void osYieldThread(void) {
    register u32 mask;

    mask = __osDisableInt();
    D_80074E30->state = 2;
    __osEnqueueAndYield(&D_80074E28);
    __osRestoreInt(mask);
}
