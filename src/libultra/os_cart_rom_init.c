#include "os_internal.h"

OSPiHandle cartRomHandle;
extern OSPiHandle* piHandleTable;
extern s32 osPiRawReadIo(u32 deviceAddress, u32* data);

OSPiHandle* osCartRomInit(void) {
    u32 domain = 0;
    u32 interruptMask;

    if (cartRomHandle.baseAddress == 0xB0000000) {
        return &cartRomHandle;
    }
    cartRomHandle.type = 0;
    cartRomHandle.baseAddress = 0xB0000000;
    osPiRawReadIo(0, &domain);
    cartRomHandle.latency = domain & 0xFF;
    cartRomHandle.pulse = (domain >> 8) & 0xFF;
    cartRomHandle.pageSize = (domain >> 16) & 0xF;
    cartRomHandle.relDuration = (domain >> 20) & 0xF;
    cartRomHandle.domain = 0;
    bzero(&cartRomHandle.transferInfo, sizeof(cartRomHandle.transferInfo));
    interruptMask = __osDisableInt();
    cartRomHandle.next = piHandleTable;
    piHandleTable = &cartRomHandle;
    __osRestoreInt(interruptMask);
    return &cartRomHandle;
}
