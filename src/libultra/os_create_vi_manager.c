#include "os_internal.h"

OSDevMgr viDevMgr = { 0 };
static OSThread viThread;
static u64 viThreadStack[512];
static OSMesgQueue viEventQueue;
static OSMesg viEventBuf[5];
static union {
    OSIoMesg msg;
    u64 forceAlignment;
} viRetraceMsg;
static union {
    OSIoMesg msg;
    u64 forceAlignment;
} viCounterMsg;
extern void viMgrMain(void* argument);
extern void __osTimerServicesInit(void);

void osCreateViManager(s32 priority) {
    u32 savedMask;
    s32 oldPriority;
    s32 currentPriority;

    if (viDevMgr.active) {
        return;
    }
    __osTimerServicesInit();
    osCreateMesgQueue(&viEventQueue, viEventBuf, 5);
    viRetraceMsg.msg.hdr.type = 13;
    viRetraceMsg.msg.hdr.priority = 0;
    viRetraceMsg.msg.hdr.retQueue = 0;
    viCounterMsg.msg.hdr.type = 14;
    viCounterMsg.msg.hdr.priority = 0;
    viCounterMsg.msg.hdr.retQueue = 0;
    osSetEventMesg(7, &viEventQueue, &viRetraceMsg.msg);
    osSetEventMesg(3, &viEventQueue, &viCounterMsg.msg);
    oldPriority = -1;
    currentPriority = osGetThreadPri(0);
    if (currentPriority < priority) {
        oldPriority = currentPriority;
        osSetThreadPri(0, priority);
    }
    savedMask = __osDisableInt();
    viDevMgr.active = 1;
    viDevMgr.thread = &viThread;
    viDevMgr.cmdQueue = &viEventQueue;
    viDevMgr.evtQueue = &viEventQueue;
    viDevMgr.acsQueue = 0;
    viDevMgr.dma = 0;
    viDevMgr.edma = 0;
    osCreateThread(&viThread, 0, viMgrMain, &viDevMgr,
                   &viThreadStack[512], priority);
    __osViInit();
    osStartThread(&viThread);
    __osRestoreInt(savedMask);
    if (oldPriority != -1) {
        osSetThreadPri(0, oldPriority);
    }
}
