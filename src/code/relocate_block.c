#include "types.h"

void func_8000E518(u8* block) {
    u32 first = *(u32*)(block + 8);
    u32 second = *(u32*)(block + 0xC);
    u32 third = *(u32*)(block + 0x10);

    *(u8**)(block + 8) = block + first;
    *(u8**)(block + 0xC) = block + second;
    if (third != 0) {
        *(u8**)(block + 0x10) = block + third;
    }
    if (*(u32*)(block + 0x14) != 0) {
        *(u8**)(block + 0x14) = block + *(u32*)(block + 0x14);
    }
}
