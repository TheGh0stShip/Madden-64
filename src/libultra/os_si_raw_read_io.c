#include "types.h"

extern s32 __osSiDeviceBusy(void);

s32 __osSiRawReadIo(u32 deviceAddress, u32* value) {
    if (__osSiDeviceBusy()) {
        return -1;
    }
    *value = *(volatile u32*)(0xA0000000 | deviceAddress);
    return 0;
}
