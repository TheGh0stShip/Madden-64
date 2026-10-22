#include "os_internal.h"

typedef struct OSExceptionVector {
    u32 word[4];
} OSExceptionVector;

extern OSExceptionVector exceptionPreamble[];
extern u32 resetType;
extern u32 tvType;
extern u8 appNmiBuffer[64];
extern u32 __osGetSR(void);
extern void __osSetSR(u32 value);
extern void __osSetFpcCsr(u32 value);
extern s32 __osSiRawReadIo(u32 address, u32* value);
extern s32 __osSiRawWriteIo(u32 address, u32 value);
extern void osInvalICache(void* address, s32 size);
extern void osMapTLBRdb(void);
extern s32 __osPiRawReadIo(u32 address, u32* value);

u64 osClockRate = 62500000ULL;
s32 osViClock = 48681812;
u32 __osShutdown = 0;
u32 __OSGlobalIntMask = 0x003FFF01;
u32 __osFinalrom;

void osInitialize(void) {
    u32 pifData;
    u32 clock = 0;

    __osFinalrom = 1;
    __osSetSR(__osGetSR() | 0x20000000);
    __osSetFpcCsr(0x01000800);
    while (__osSiRawReadIo(0x1FC007FC, &pifData)) {
    }
    while (__osSiRawWriteIo(0x1FC007FC, pifData | 8)) {
    }
    *(OSExceptionVector*)0x80000000 = *exceptionPreamble;
    *(OSExceptionVector*)0x80000080 = *exceptionPreamble;
    *(OSExceptionVector*)0x80000100 = *exceptionPreamble;
    *(OSExceptionVector*)0x80000180 = *exceptionPreamble;
    osWritebackDCache((void*)0x80000000, 0x190);
    osInvalICache((void*)0x80000000, 0x190);
    osMapTLBRdb();
    __osPiRawReadIo(4, &clock);
    clock &= ~0xF;
    if (clock != 0) {
        osClockRate = clock;
    }
    osClockRate = osClockRate * 3 / 4;
    if (resetType == 0) {
        bzero(appNmiBuffer, 64);
    }
    if (tvType == 0) {
        osViClock = 49656530;
    } else if (tvType == 2) {
        osViClock = 48628316;
    } else {
        osViClock = 48681812;
    }
}
