#include "types.h"

void func_80041620(u8* wrapper, s8 value) {
    u8* object = *(u8**)(wrapper + 8);

    *(s8*)(object + 0x18) = value;
}
