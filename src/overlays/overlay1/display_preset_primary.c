#include "types.h"

void func_800AA184(u8* object) {
    *(u32*)(object + 0xB0) = 0xFE400000;
    *(u32*)(object + 0xB4) = 0x01C00000;
    *(u32*)(object + 0xB8) = 0xFB600000;
    *(u32*)(object + 0xBC) = 0x02C00000;
}
