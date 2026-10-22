#ifndef MADDEN64_OS_INTERNAL_H
#define MADDEN64_OS_INTERNAL_H

#include "types.h"

typedef void* OSMesg;
typedef u64 OSTime;

typedef struct OSThreadContext {
    u64 at, v0, v1, a0, a1, a2, a3;
    u64 t0, t1, t2, t3, t4, t5, t6, t7;
    u64 s0, s1, s2, s3, s4, s5, s6, s7;
    u64 t8, t9, gp, sp, s8, ra;
    u64 lo, hi;
    u32 sr, pc, cause, badvaddr, rcp;
    u32 fpcsr;
    f64 fp0, fp2, fp4, fp6, fp8, fp10, fp12, fp14;
    f64 fp16, fp18, fp20, fp22, fp24, fp26, fp28, fp30;
} OSThreadContext;

typedef struct OSThread {
    struct OSThread* next;
    s32 priority;
    struct OSThread** queue;
    struct OSThread* tlnext;
    u16 state;
    u16 flags;
    s32 id;
    s32 fp;
    OSThreadContext context;
} OSThread;

typedef struct OSMesgQueue {
    OSThread* mtqueue;
    OSThread* fullqueue;
    s32 validCount;
    s32 first;
    s32 msgCount;
    OSMesg* messages;
} OSMesgQueue;

typedef struct OSBlockInfo {
    s32 errStatus;
    void* dramAddr;
    u32 c2Addr;
    u32 sectorSize;
    u32 c1ErrNum;
    u32 c1ErrSector[4];
} OSBlockInfo;

typedef struct OSTranxInfo {
    s32 cmdType;
    u16 transferMode;
    u16 blockNum;
    s32 sectorNum;
    u32 devAddr;
    u32 bmCtlShadow;
    u32 seqCtlShadow;
    OSBlockInfo block[2];
} OSTranxInfo;

typedef struct OSPiHandle {
    struct OSPiHandle* next;
    u8 type;
    u8 latency;
    u8 pageSize;
    u8 relDuration;
    u8 pulse;
    u8 domain;
    u32 baseAddress;
    u32 speed;
    OSTranxInfo transferInfo;
} OSPiHandle;

typedef struct OSTimer {
    struct OSTimer* next;
    struct OSTimer* prev;
    OSTime interval;
    OSTime value;
    OSMesgQueue* mq;
    OSMesg msg;
} OSTimer;

typedef struct OSIoMesg {
    struct {
        u16 type;
        u8 priority;
        u8 status;
        OSMesgQueue* retQueue;
    } hdr;
    void* dramAddr;
    u32 devAddr;
    u32 size;
    OSPiHandle* piHandle;
} OSIoMesg;

typedef struct OSDevMgr {
    s32 active;
    OSThread* thread;
    OSMesgQueue* cmdQueue;
    OSMesgQueue* evtQueue;
    OSMesgQueue* acsQueue;
    s32 (*dma)(s32, u32, void*, u32);
    s32 (*edma)(OSPiHandle*, s32, u32, void*, u32);
} OSDevMgr;

typedef struct OSViMode {
    u8 type;
    u8 pad[3];
    u32 control;
    u32 width;
    u32 burst;
    u32 vSync;
    u32 hSync;
    u32 leap;
    u32 hStart;
    u32 xScale;
    u32 vCurrent;
    struct {
        u32 origin;
        u32 yScale;
        u32 vStart;
        u32 vBurst;
        u32 vIntr;
    } fldRegs[2];
} OSViMode;

typedef struct OSViScale {
    f32 factor;
    u16 offset;
    u16 pad;
    u32 scale;
} OSViScale;

typedef struct OSViContext {
    u16 state;
    u16 retraceCount;
    void* framep;
    OSViMode* modep;
    u32 control;
    OSMesgQueue* msgq;
    OSMesg msg;
    OSViScale x;
    OSViScale y;
} OSViContext;

typedef struct OSTaskData {
    u32 type;
    u32 flags;
    u64* ucode_boot;
    u32 ucode_boot_size;
    u64* ucode;
    u32 ucode_size;
    u64* ucode_data;
    u32 ucode_data_size;
    u64* dram_stack;
    u32 dram_stack_size;
    u64* output_buff;
    u64* output_buff_size;
    u64* data_ptr;
    u32 data_size;
    u64* yield_data_ptr;
    u32 yield_data_size;
} OSTaskData;

typedef union OSTask {
    OSTaskData t;
    s64 align;
} OSTask;

extern OSThread* D_80074E30;
extern OSThread* D_80074E28;
extern OSThread* D_80074E2C;
extern OSViContext* D_80074EA4;
extern OSViContext* D_80074EA0;
extern u32 D_80074E10;
extern u32 D_80074E00;
extern OSMesg D_8007D308[1];
extern OSMesgQueue D_8007D310;
extern OSMesg D_8007D258[1];
extern OSMesgQueue D_8007D260;
extern void bzero(void* address, s32 size);
extern u32 D_80000308;
extern OSPiHandle* D_80074DF0[2];
extern s32 D_80074DD0;
extern u32 __osDisableInt(void);
extern void __osRestoreInt(u32 mask);
extern void __osEnqueueAndYield(OSThread** queue);
extern void __osEnqueueThread(OSThread** queue, OSThread* thread);
extern OSThread* __osPopThread(OSThread** queue);
extern void __osDispatchThread(void);
extern void __osDequeueThread(OSThread** queue, OSThread* thread);
extern void osStartThread(OSThread* thread);
extern void osCreateMesgQueue(OSMesgQueue* queue, OSMesg* messages, s32 count);
extern s32 osRecvMesg(OSMesgQueue* queue, OSMesg* message, s32 flag);
extern s32 osSendMesg(OSMesgQueue* queue, OSMesg message, s32 flag);
extern u32 osVirtualToPhysical(void* address);
extern OSTimer* D_80074ED0;
extern OSTime D_8007E5A8;
extern u32 D_8007E5B0;
extern u32 D_8007E5B4;
extern u32 D_8007E5B8;
extern OSTime __osInsertTimer(OSTimer* timer);
extern void __osSetTimerIntr(OSTime time);
extern u32 osGetCount(void);
extern void __osSetCompare(u32 value);
extern s32 osJamMesg(OSMesgQueue* queue, OSMesg message, s32 flag);
extern OSMesgQueue* osPiGetCmdQueue(void);
extern void osWritebackDCache(void* address, s32 size);
extern void __osSpSetStatus(u32 status);
extern s32 __osSpSetPc(u32 pc);
extern s32 __osSpRawStartDma(s32 direction, u32 deviceAddress,
                             void* dramAddress, u32 size);
extern s32 __osSpDeviceBusy(void);
extern void osCreateThread(OSThread* thread, s32 id,
                           void (*entry)(void*), void* argument,
                           void* stack, s32 priority);
extern s32 osGetThreadPri(OSThread* thread);
extern void osSetThreadPri(OSThread* thread, s32 priority);
extern void osSetEventMesg(s32 event, OSMesgQueue* queue, OSMesg message);
extern void __osPiCreateAccessQueue(void);
extern s32 __osPiRawStartDma(s32 direction, u32 deviceAddress,
                             void* dramAddress, u32 size);
extern s32 __osEPiRawStartDma(OSPiHandle* handle, s32 direction,
                              u32 deviceAddress, void* dramAddress,
                              u32 size);
extern s32 __osEPiRawReadIo(OSPiHandle* handle, u32 deviceAddress,
                            u32* data);
extern s32 __osEPiRawWriteIo(OSPiHandle* handle, u32 deviceAddress,
                             u32 data);
extern void __osDevMgrMain(void* argument);
extern OSMesgQueue D_8007D260;
extern void __osViInit(void);

#endif
