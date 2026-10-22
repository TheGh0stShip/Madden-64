#include "os_internal.h"

void __osTimerInterrupt(void) {
    OSTimer* timer;
    u32 count;
    u32 elapsed;

    if (D_80074ED0->next == D_80074ED0) {
        return;
    }
    for (;;) {
        timer = D_80074ED0->next;
        if (timer == D_80074ED0) {
            __osSetCompare(0);
            D_8007E5B8 = 0;
            break;
        }
        count = osGetCount();
        elapsed = count - D_8007E5B8;
        D_8007E5B8 = count;
        if (elapsed < timer->value) {
            timer->value -= elapsed;
            __osSetTimerIntr(timer->value);
            break;
        }
        timer->prev->next = timer->next;
        timer->next->prev = timer->prev;
        timer->next = 0;
        timer->prev = 0;
        if (timer->mq != 0) {
            osSendMesg(timer->mq, timer->msg, 0);
        }
        if (timer->interval != 0) {
            timer->value = timer->interval;
            __osInsertTimer(timer);
        }
    }
}
