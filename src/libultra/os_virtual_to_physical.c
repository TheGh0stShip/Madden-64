#include "types.h"

extern u32 __osProbeTLB(void* address);

u32 osVirtualToPhysical(void* address) {
    if ((u32)address >= 0x80000000 && (u32)address < 0xA0000000) {
        return (u32)address & 0x1FFFFFFF;
    } else if ((u32)address >= 0xA0000000 && (u32)address < 0xC0000000) {
        return (u32)address & 0x1FFFFFFF;
    } else {
        return __osProbeTLB(address);
    }
}
