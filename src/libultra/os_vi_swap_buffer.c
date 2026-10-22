#include "os_internal.h"

void osViSwapBuffer(void* frameBuffer) {
    u32 mask;

    mask = __osDisableInt();
    D_80074EA4->framep = frameBuffer;
    D_80074EA4->state |= 0x10;
    __osRestoreInt(mask);
}
