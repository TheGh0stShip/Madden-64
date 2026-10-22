#include "types.h"

extern s32 __osSiDeviceBusy(void);

s32 __osSiRawWriteIo(u32 deviceAddress, u32 value) {
    if (__osSiDeviceBusy()) {
        return -1;
    }
    *(volatile u32*)(0xA0000000 | deviceAddress) = value;
    return 0;
}
