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

typedef struct OSPiHandle {
    struct OSPiHandle* next;
    u8 type;
    u8 latency;
    u8 pageSize;
    u8 relDuration;
    u8 pulse;
    u8 domain;
    u32 baseAddress;
} OSPiHandle;

typedef struct OSTimer {
    struct OSTimer* next;
    struct OSTimer* prev;
    OSTime interval;
    OSTime value;
    OSMesgQueue* mq;
    OSMesg msg;
} OSTimer;

typedef struct OSViMode {
    u8 type;
    u8 pad[3];
    u32 control;
} OSViMode;

typedef struct OSViContext {
    u16 state;
    u16 retraceCount;
    void* framep;
    OSViMode* modep;
    u32 control;
    OSMesgQueue* msgq;
    OSMesg msg;
} OSViContext;

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
extern u32 D_80000308;
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

#endif
