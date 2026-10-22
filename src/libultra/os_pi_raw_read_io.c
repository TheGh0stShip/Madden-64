#include "os_internal.h"

s32 osPiRawReadIo(u32 deviceAddress, u32* value) {
    register u32 status;

    while ((status = *(volatile u32*)0xA4600010) & 3) {
    }
    *value = *(volatile u32*)(0xA0000000 | (D_80000308 | deviceAddress));
    return 0;
}
