#include "os_internal.h"

OSPiHandle diskHandle;
extern OSPiHandle* piHandleTable;
extern OSPiHandle* __osDiskHandle;

OSPiHandle* osLeoDiskInit(void) {
    u32 interruptMask;

    diskHandle.type = 2;
    diskHandle.baseAddress = 0xA5000000;
    diskHandle.latency = 3;
    diskHandle.pulse = 6;
    diskHandle.pageSize = 6;
    diskHandle.relDuration = 2;
    diskHandle.domain = 1;
    *(volatile u32*)0xA4600024 = diskHandle.latency;
    *(volatile u32*)0xA4600028 = diskHandle.pulse;
    *(volatile u32*)0xA460002C = diskHandle.pageSize;
    *(volatile u32*)0xA4600030 = diskHandle.relDuration;
    bzero(&diskHandle.transferInfo, sizeof(diskHandle.transferInfo));
    interruptMask = __osDisableInt();
    diskHandle.next = piHandleTable;
    piHandleTable = &diskHandle;
    __osDiskHandle = &diskHandle;
    __osRestoreInt(interruptMask);
    return &diskHandle;
}
