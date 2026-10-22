#include "types.h"

extern s32 func_80031A1C(s32 limit);

s32 func_800D1498(u8* object) {
    if ((*(u16*)(object + 0x28) & 1) == 0) {
        *(s32*)(object + 0x8C) = (func_80031A1C(15) & 0xFFFF) + 15;
    }
    return 0;
}
