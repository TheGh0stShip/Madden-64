#include "os_internal.h"

void osSetThreadPri(OSThread* thread, s32 priority) {
    register u32 mask;

    mask = __osDisableInt();
    if (thread == 0) {
        thread = D_80074E30;
    }
    if (thread->priority != priority) {
        thread->priority = priority;
        if (thread != D_80074E30 && thread->state != 1) {
            __osDequeueThread(thread->queue, thread);
            __osEnqueueThread(thread->queue, thread);
        }
        if (D_80074E30->priority < D_80074E28->priority) {
            D_80074E30->state = 2;
            __osEnqueueAndYield(&D_80074E28);
        }
    }
    __osRestoreInt(mask);
}
