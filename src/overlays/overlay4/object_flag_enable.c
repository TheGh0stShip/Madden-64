#include "types.h"

s32 func_800E42F8(u8* object) {
    u8* state = *(u8**)(object + 0x24);

    *(u32*)(state + 0x14) |= 0x200;
    return 1;
}
