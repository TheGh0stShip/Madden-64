#include "types.h"

void func_8005EE88(u8* object) {
    u8* runtime = *(u8**)(object + 0x1C0);

    *(u32*)(runtime + 0x5C) = *(u32*)(object + 0x134);
    *(u32*)(runtime + 0x60) = *(u32*)(object + 0x74);
}
