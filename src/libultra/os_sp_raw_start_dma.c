#include "os_internal.h"

extern s32 __osSpDeviceBusy(void);

s32 __osSpRawStartDma(s32 direction, u32 deviceAddress, void* dramAddress, u32 size) {
    if (__osSpDeviceBusy()) {
        return -1;
    }
    *(volatile u32*)0xA4040000 = deviceAddress;
    *(volatile u32*)0xA4040004 = osVirtualToPhysical(dramAddress);
    if (direction == 0) {
        *(volatile u32*)0xA404000C = size - 1;
    } else {
        *(volatile u32*)0xA4040008 = size - 1;
    }
    return 0;
}
