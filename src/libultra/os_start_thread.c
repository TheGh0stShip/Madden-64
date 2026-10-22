#include "os_internal.h"

void osStartThread(OSThread* thread) {
    register u32 mask = __osDisableInt();

    switch (thread->state) {
        case 8:
            thread->state = 2;
            __osEnqueueThread(&D_80074E28, thread);
            break;
        case 1:
            if (thread->queue == 0 || thread->queue == &D_80074E28) {
                thread->state = 2;
                __osEnqueueThread(&D_80074E28, thread);
            } else {
                thread->state = 8;
                __osEnqueueThread(thread->queue, thread);
                __osEnqueueThread(&D_80074E28, __osPopThread(thread->queue));
            }
            break;
    }

    if (D_80074E30 == 0) {
        __osDispatchThread();
    } else if (D_80074E30->priority < D_80074E28->priority) {
        D_80074E30->state = 2;
        __osEnqueueAndYield(&D_80074E28);
    }
    __osRestoreInt(mask);
}
