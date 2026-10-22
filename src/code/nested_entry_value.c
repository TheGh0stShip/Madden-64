#include "types.h"

u32 func_800430F4(u8** object, u16 index) {
    u8* entries = *(u8**)(*object + 0x18);

    entries += index * 4;
    return *(u32*)(entries + 4);
}
