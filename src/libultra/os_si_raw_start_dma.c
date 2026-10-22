#include "os_internal.h"

extern s32 __osSiDeviceBusy(void);
extern void osWritebackDCache(void* address, s32 size);
extern void osInvalDCache(void* address, s32 size);

s32 __osSiRawStartDma(s32 direction, void* dramAddress) {
    if (__osSiDeviceBusy()) {
        return -1;
    }
    if (direction == 1) {
        osWritebackDCache(dramAddress, 0x40);
    }
    *(volatile u32*)0xA4800000 = osVirtualToPhysical(dramAddress);
    if (direction == 0) {
        *(volatile u32*)0xA4800004 = 0x1FC007C0;
    } else {
        *(volatile u32*)0xA4800010 = 0x1FC007C0;
    }
    if (direction == 0) {
        osInvalDCache(dramAddress, 0x40);
    }
    return 0;
}
