#include "types.h"

s32 func_800CF428(u8* object) {
    if ((*(u16*)(object + 0x28) & 1) == 0) {
        *(s32*)(object + 0xA0) = 0;
        *(s32*)(object + 0x9C) = object[0x66] << 5;
        *(s32*)(object + 0x98) = 0x1C - (object[0x17] >> 4);
        *(s32*)(object + 0x8C) = *(s32*)0x80084F34;
    }
    return 0;
}
