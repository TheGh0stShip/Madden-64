#include "os_internal.h"

static OSThread piThread;
static u64 piThreadStack[4096 / sizeof(u64)];
static OSMesgQueue piEventQueue;
static OSMesg piEventBuffer[1];

OSDevMgr piDeviceManager = { 0 };
OSPiHandle* piHandleTable = 0;
extern OSPiHandle cartRomHandle;
extern OSPiHandle diskHandle;
OSPiHandle* currentPiHandle[2] = {
    &cartRomHandle, &diskHandle
};

void osCreatePiManager(s32 priority, OSMesgQueue* commandQueue,
                       OSMesg* commandBuffer, s32 commandCount) {
    u32 interruptMask;
    s32 oldPriority;
    s32 currentPriority;

    if (piDeviceManager.active) {
        return;
    }
    osCreateMesgQueue(commandQueue, commandBuffer, commandCount);
    osCreateMesgQueue(&piEventQueue, piEventBuffer, 1);
    if (!D_80074E00) {
        __osPiCreateAccessQueue();
    }
    osSetEventMesg(8, &piEventQueue, (OSMesg)0x22222222);
    oldPriority = -1;
    currentPriority = osGetThreadPri(0);
    if (currentPriority < priority) {
        oldPriority = currentPriority;
        osSetThreadPri(0, priority);
    }
    interruptMask = __osDisableInt();
    piDeviceManager.active = 1;
    piDeviceManager.thread = &piThread;
    piDeviceManager.cmdQueue = commandQueue;
    piDeviceManager.evtQueue = &piEventQueue;
    piDeviceManager.acsQueue = &D_8007D260;
    piDeviceManager.dma = __osPiRawStartDma;
    piDeviceManager.edma = __osEPiRawStartDma;
    osCreateThread(&piThread, 0, __osDevMgrMain, &piDeviceManager,
                   &piThreadStack[4096 / sizeof(u64)], priority);
    osStartThread(&piThread);
    __osRestoreInt(interruptMask);
    if (oldPriority != -1) {
        osSetThreadPri(0, oldPriority);
    }
}
