#include "types.h"

extern u32 D_800878A8[];
extern u32 D_80089380[];

u32 func_800C1DF0(u8* object) {
    u8 index = object[0x21] & 0xBF;

    return D_800878A8[index] ^ D_80089380[index];
}
