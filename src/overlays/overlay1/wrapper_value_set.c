#include "types.h"

void func_8009D4D8(u8* wrapper, s32 value) {
    u8* object = *(u8**)(wrapper + 8);

    *(s32*)(object + 0x18) = value;
}
