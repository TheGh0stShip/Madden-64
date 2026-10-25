#include "os_internal.h"

extern s32 osPiStartDma(OSIoMesg* message, s32 priority, s32 direction,
                        u32 deviceAddress, void* dramAddress, u32 size,
                        OSMesgQueue* returnQueue);

void rom_dma_read(void* destination, u32 romAddress, u32 size) {
    OSIoMesg request;
    OSMesg message;
    OSMesgQueue queue;

    if (size != 0) {
        size += size & 1;
        osCreateMesgQueue(&queue, &message, 1);
        osPiStartDma(&request, 0, 0, romAddress, destination, size, &queue);
        osRecvMesg(&queue, 0, 1);
    }
}
