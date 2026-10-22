#include "os_internal.h"

s32 osPiStartDma(OSIoMesg* message, s32 priority, s32 direction,
                 u32 deviceAddress, void* dramAddress, u32 size,
                 OSMesgQueue* returnQueue) {
    register s32 result;

    if (!D_80074DD0) {
        return -1;
    }
    if (direction == 0) {
        message->hdr.type = 11;
    } else {
        message->hdr.type = 12;
    }
    message->hdr.priority = priority;
    message->hdr.retQueue = returnQueue;
    message->dramAddr = dramAddress;
    message->devAddr = deviceAddress;
    message->size = size;
    message->piHandle = 0;
    if (priority == 1) {
        result = osJamMesg(osPiGetCmdQueue(), message, 0);
    } else {
        result = osSendMesg(osPiGetCmdQueue(), message, 0);
    }
    return result;
}
