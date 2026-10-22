#include "types.h"

void osDpGetCounters(u32* counters) {
    *counters++ = *(volatile u32*)0xA4100010;
    *counters++ = *(volatile u32*)0xA4100014;
    *counters++ = *(volatile u32*)0xA4100018;
    *counters++ = *(volatile u32*)0xA410001C;
}
