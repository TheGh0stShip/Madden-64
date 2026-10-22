#include "types.h"

void func_800BD8A8(u8* object, s32* vector) {
    *(s32*)(object + 0x2C) += vector[0];
    *(s32*)(object + 0x30) += vector[1];
    *(s32*)(object + 0x34) += vector[2];
}
