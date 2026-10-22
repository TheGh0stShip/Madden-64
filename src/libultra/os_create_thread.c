#include "os_internal.h"

extern void __osCleanupThread(void);

void osCreateThread(OSThread* thread, s32 id, void (*entry)(void*), void* argument,
                    void* stack, s32 priority) {
    register u32 saveMask;
    u32 interruptMask;

    thread->id = id;
    thread->priority = priority;
    thread->next = 0;
    thread->queue = 0;
    thread->context.pc = (u32)entry;
    thread->context.a0 = (s32)argument;
    thread->context.sp = (s64)(s32)stack - 16;
    thread->context.ra = (s32)__osCleanupThread;
    interruptMask = 0x003FFF01;
    thread->context.sr = 0x0000FF03;
    thread->context.rcp = (interruptMask & 0x003F0000) >> 16;
    thread->context.fpcsr = 0x01000800;
    thread->fp = 0;
    thread->state = 1;
    thread->flags = 0;

    saveMask = __osDisableInt();
    thread->tlnext = D_80074E2C;
    D_80074E2C = thread;
    __osRestoreInt(saveMask);
}
