#include "os_internal.h"

void* osViGetCurrentFramebuffer(void) {
    register u32 savedMask;
    void* framebuffer;

    savedMask = __osDisableInt();
    framebuffer = D_80074EA0->framep;
    __osRestoreInt(savedMask);
    return framebuffer;
}
