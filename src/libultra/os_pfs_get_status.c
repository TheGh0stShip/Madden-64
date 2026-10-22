#include "controller.h"

s32 __osPfsGetStatus(OSMesgQueue* queue, s32 channel) {
    s32 result = 0;
    OSMesg message;
    u8 pattern;
    OSContStatus data[4];

    __osPfsRequestData(0);
    result = __osSiRawStartDma(1, &D_8007BFC8);
    osRecvMesg(queue, &message, 1);
    result = __osSiRawStartDma(0, &D_8007BFC8);
    osRecvMesg(queue, &message, 1);
    __osPfsGetInitData(&pattern, data);
    if ((data[channel].status & 1) != 0 &&
        (data[channel].status & 2) != 0) {
        return 2;
    }
    if (data[channel].errno != 0 || (data[channel].status & 1) == 0) {
        return 1;
    }
    if ((data[channel].status & 4) != 0) {
        return 4;
    }
    return result;
}
