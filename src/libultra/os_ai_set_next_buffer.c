#include "types.h"

extern s32 __osAiDeviceBusy(void);
extern u32 osVirtualToPhysical(void* address);

s32 osAiSetNextBuffer(void* buffer, u32 size) {
    static u8 hdwrBugFlag = 0;
    u8* adjusted = buffer;

    if (hdwrBugFlag != 0) {
        adjusted -= 0x2000;
    }

    if ((((u32)buffer + size) & 0x3FFF) == 0x2000) {
        hdwrBugFlag = 1;
    } else {
        hdwrBugFlag = 0;
    }

    if (__osAiDeviceBusy()) {
        return -1;
    }

    *(volatile u32*)0xA4500000 = osVirtualToPhysical(adjusted);
    *(volatile u32*)0xA4500004 = size;
    return 0;
}
