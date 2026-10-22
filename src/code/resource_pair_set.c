#include "types.h"

extern void func_80016FE4(void* object);

void func_8001AA3C(u8* object, s32 value) {
    *(s32*)(object + 0x2C) = value;
    *(s32*)(object + 0x30) = value;
    func_80016FE4(object);
}
