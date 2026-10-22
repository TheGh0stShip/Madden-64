#include "controller.h"

s32 osPfsIsPlug(OSMesgQueue* queue, u8* pattern) {
    s32 result = 0;
    OSMesg message;
    u8 bitPattern;
    OSContStatus data[4];
    int channel;
    u8 bits = 0;
    int retries = 3;

    __osSiGetAccess();
    while (1) {
        __osPfsRequestData(0);
        result = __osSiRawStartDma(1, &D_8007BFC8);
        osRecvMesg(queue, &message, 1);
        result = __osSiRawStartDma(0, &D_8007BFC8);
        osRecvMesg(queue, &message, 1);
        __osPfsGetInitData(&bitPattern, data);
        for (channel = 0; channel < D_8007E609; channel++) {
            if ((data[channel].status & 4) == 0) {
                retries--;
                break;
            }
        }
        if (D_8007E609 == channel) {
            retries = 0;
        }
        if (retries < 1) {
            break;
        }
    }
    for (channel = 0; channel < D_8007E609; channel++) {
        if (data[channel].errno == 0 &&
            (data[channel].status & 1) != 0) {
            bits |= 1 << channel;
        }
    }
    __osSiRelAccess();
    *pattern = bits;
    return result;
}
