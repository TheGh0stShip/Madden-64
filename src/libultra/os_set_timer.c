#include "os_internal.h"

s32 osSetTimer(OSTimer* timer, OSTime countdown, OSTime interval,
               OSMesgQueue* queue, OSMesg message) {
    OSTime time;

    timer->next = 0;
    timer->prev = 0;
    timer->interval = interval;
    timer->value = countdown != 0 ? countdown : interval;
    timer->mq = queue;
    timer->msg = message;
    time = __osInsertTimer(timer);
    if (D_80074ED0->next == timer) {
        __osSetTimerIntr(time);
    }
    return 0;
}
