#include "types.h"

void func_80062AF8(u8* object) {
    u8* runtime = *(u8**)(object + 0x1C0);

    *(u32*)(runtime + 0x24) = 0;
    *(u32*)(runtime + 0x2C) = *(u32*)(object + 0x74);
}
