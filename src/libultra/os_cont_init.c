#include "controller.h"

#define USEC_TO_CYCLES(value) (((u64)(value) * D_80074DB0) / 1000000ULL)

s32 osContInit(OSMesgQueue* queue, u8* pattern, OSContStatus* data) {
    OSMesg message;
    s32 result = 0;
    OSTime time;
    OSTimer timer;
    OSMesgQueue timerQueue;

    if (D_80075CF0) {
        return 0;
    }
    D_80075CF0 = 1;
    time = osGetTime();
    if (time < USEC_TO_CYCLES(500000)) {
        osCreateMesgQueue(&timerQueue, &message, 1);
        osSetTimer(&timer, USEC_TO_CYCLES(500000) - time, 0, &timerQueue, &message);
        osRecvMesg(&timerQueue, &message, 1);
    }
    D_8007E609 = 4;
    __osPackRequestData(0);
    result = __osSiRawStartDma(1, &D_8007E5C8);
    osRecvMesg(queue, &message, 1);
    result = __osSiRawStartDma(0, &D_8007E5C8);
    osRecvMesg(queue, &message, 1);
    __osContGetInitData(pattern, data);
    D_8007E608 = 0;
    __osSiCreateAccessQueue();
    osCreateMesgQueue(&D_8007E630, &D_8007E648, 1);
    return result;
}
