#include "os_internal.h"

s32 osEPiRawReadIo(OSPiHandle* handle, u32 devAddr, u32* data) {
    register u32 stat;

    while ((stat = *(volatile u32*)0xA4600010) & 3) {
    }
    *data = *(volatile u32*)(0xA0000000 | (handle->baseAddress | devAddr));
    return 0;
}
