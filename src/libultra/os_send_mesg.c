#include "os_internal.h"

s32 osSendMesg(OSMesgQueue* queue, OSMesg message, s32 flag) {
    register u32 mask;
    register s32 index;

    mask = __osDisableInt();
    while (queue->validCount >= queue->msgCount) {
        if (flag == 1) {
            D_80074E30->state = 8;
            __osEnqueueAndYield(&queue->fullqueue);
        } else {
            __osRestoreInt(mask);
            return -1;
        }
    }
    index = (queue->first + queue->validCount) % queue->msgCount;
    queue->messages[index] = message;
    queue->validCount++;
    if (queue->mtqueue->next != 0) {
        osStartThread(__osPopThread(&queue->mtqueue));
    }
    __osRestoreInt(mask);
    return 0;
}
