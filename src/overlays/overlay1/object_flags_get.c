#include "types.h"

u16 func_80099818(u8* wrapper) {
    u8* object = *(u8**)(wrapper + 8);

    return *(u16*)(object + 0x68);
}
