#include "types.h"

void func_8001B590(u8* wrapper, u8* source) {
    u8* destination = *(u8**)(wrapper + 8);

    *(u32*)(destination + 0) = *(u32*)(source + 0);
    *(u16*)(destination + 4) = *(u16*)(source + 4);
    *(u16*)(destination + 6) = *(u16*)(source + 6);
    *(u32*)(destination + 8) = *(u32*)(source + 8);
}
