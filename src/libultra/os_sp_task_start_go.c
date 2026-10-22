#include "types.h"

typedef struct OSTask OSTask;

extern s32 __osSpDeviceBusy(void);
extern void __osSpSetStatus(u32 status);

void osSpTaskStartGo(OSTask* task) {
    while (__osSpDeviceBusy()) {
    }
    __osSpSetStatus(0x125);
}
