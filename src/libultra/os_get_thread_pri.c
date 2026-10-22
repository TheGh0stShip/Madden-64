#include "types.h"

typedef struct OSThread {
    struct OSThread* next;
    s32 priority;
} OSThread;

extern OSThread* D_80074E30;

s32 osGetThreadPri(OSThread* thread) {
    if (thread == 0) {
        thread = D_80074E30;
    }
    return thread->priority;
}
