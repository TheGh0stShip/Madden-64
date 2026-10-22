#include "os_internal.h"

#define WRITE32(address, value) (*(volatile u32*)(address) = (value))

s32 osEPiRawStartDma(OSPiHandle* handle, s32 direction, u32 deviceAddress,
                     void* dramAddress, u32 size) {
    u32 status;
    u32 domain;
    OSPiHandle* current;

    status = *(volatile u32*)0xA4600010;
    while (status & 3) {
        status = *(volatile u32*)0xA4600010;
    }
    domain = handle->domain;
    if (D_80074DF0[domain] != handle) {
        current = D_80074DF0[domain];
        if (domain == 0) {
            if (current->latency != handle->latency) {
                WRITE32(0xA4600014, handle->latency);
            }
            if (current->pageSize != handle->pageSize) {
                WRITE32(0xA460001C, handle->pageSize);
            }
            if (current->relDuration != handle->relDuration) {
                WRITE32(0xA4600020, handle->relDuration);
            }
            if (current->pulse != handle->pulse) {
                WRITE32(0xA4600018, handle->pulse);
            }
        } else {
            if (current->latency != handle->latency) {
                WRITE32(0xA4600024, handle->latency);
            }
            if (current->pageSize != handle->pageSize) {
                WRITE32(0xA460002C, handle->pageSize);
            }
            if (current->relDuration != handle->relDuration) {
                WRITE32(0xA4600030, handle->relDuration);
            }
            if (current->pulse != handle->pulse) {
                WRITE32(0xA4600028, handle->pulse);
            }
        }
        D_80074DF0[domain] = handle;
    }
    WRITE32(0xA4600000, osVirtualToPhysical(dramAddress));
    WRITE32(0xA4600004, (handle->baseAddress | deviceAddress) & 0x1FFFFFFF);
    switch (direction) {
        case 0:
            WRITE32(0xA460000C, size - 1);
            break;
        case 1:
            WRITE32(0xA4600008, size - 1);
            break;
        default:
            return -1;
    }
    return 0;
}
