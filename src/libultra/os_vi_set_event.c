#include "os_internal.h"

void osViSetEvent(OSMesgQueue* queue, OSMesg message, u32 retraceCount) {
    register u32 mask;

    mask = __osDisableInt();
    D_80074EA4->msgq = queue;
    D_80074EA4->msg = message;
    D_80074EA4->retraceCount = retraceCount;
    __osRestoreInt(mask);
}
