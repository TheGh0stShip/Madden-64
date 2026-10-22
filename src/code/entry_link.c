#include "types.h"

void func_80034154(u8* source, u8* destination) {
    *(s32*)(destination + 0x20) = *(s32*)(source + 0x18) + 4;
}
