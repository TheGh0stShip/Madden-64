#include "types.h"

void func_80058C88(u8* object) {
    u8* runtime = *(u8**)(object + 0x1B4);

    *(u32*)(object + 0xD8) = 0;
    *(u32*)(object + 0x90) = 0;
    *(u32*)(object + 0x19C) = 0;
    *(u32*)(runtime + 0x50) = 0;
    runtime = *(u8**)(object + 0x1B4);
    *(u32*)(runtime + 0x54) = 0;
    runtime = *(u8**)(object + 0x1B4);
    *(u32*)(runtime + 0x5C) = 0;
}
