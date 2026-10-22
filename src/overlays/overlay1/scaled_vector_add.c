#include "types.h"

void func_800BD8DC(u8* object, u16 scale, s32* vector) {
    *(s32*)(object + 0x2C) += vector[0] * scale;
    *(s32*)(object + 0x30) += vector[1] * scale;
    *(s32*)(object + 0x34) += vector[2] * scale;
}
