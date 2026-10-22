#include "os_internal.h"

s32 osRecvMesg(OSMesgQueue* queue, OSMesg* message, s32 flag) {
    register u32 mask;

    mask = __osDisableInt();
    while (queue->validCount == 0) {
        if (flag == 0) {
            __osRestoreInt(mask);
            return -1;
        }
        D_80074E30->state = 8;
        __osEnqueueAndYield(&queue->mtqueue);
    }
    if (message != 0) {
        *message = queue->messages[queue->first];
    }
    queue->first = (queue->first + 1) % queue->msgCount;
    queue->validCount--;
    if (queue->fullqueue->next != 0) {
        osStartThread(__osPopThread(&queue->fullqueue));
    }
    __osRestoreInt(mask);
    return 0;
}
