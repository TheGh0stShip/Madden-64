#include "types.h"

s16 func_800C0728(u8* object) {
    u32 index = object[0x21] & 0xBF;
    u32 state = *(u32*)(0x800878A8 + index * 4);

    return *(s16*)(0x80069BEC + ((state & 0xF00) >> 7));
}
