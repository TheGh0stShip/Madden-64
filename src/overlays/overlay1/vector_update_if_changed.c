#include "types.h"

void func_800A757C(u8* object, s32* vector) {
    if (vector[0] == *(s32*)(object + 0x2C) &&
        vector[1] == *(s32*)(object + 0x30) &&
        vector[2] == *(s32*)(object + 0x34)) {
        return;
    }
    *(s32*)(object + 0x2C) = vector[0];
    *(s32*)(object + 0x30) = vector[1];
    *(s32*)(object + 0x34) = vector[2];
    *(u16*)(object + 0x84) |= 0x21;
}
