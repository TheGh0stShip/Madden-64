#include "types.h"

void func_80099804(u8* wrapper, u16 bits) {
    u8* object = *(u8**)(wrapper + 8);

    *(u16*)(object + 0x68) |= bits;
}
