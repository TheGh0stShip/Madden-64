#include "os_internal.h"

void osDestroyThread(OSThread* thread) {
    register u32 mask;
    register OSThread* previous;
    register OSThread* next;

    mask = __osDisableInt();
    if (thread == 0) {
        thread = D_80074E30;
    } else if (thread->state != 1) {
        __osDequeueThread(thread->queue, thread);
    }
    if (D_80074E2C == thread) {
        D_80074E2C = D_80074E2C->tlnext;
    } else {
        previous = D_80074E2C;
        while ((next = previous->tlnext) != 0) {
            if (next == thread) {
                previous->tlnext = thread->tlnext;
                break;
            }
            previous = next;
        }
    }
    if (thread == D_80074E30) {
        __osDispatchThread();
    }
    __osRestoreInt(mask);
}
