#include "types.h"

void func_800BD5D4(u8* object, u16 amount) {
    if ((*(u32*)(object + 0x14) & 0x10) && *(u32*)(object + 0x24)) {
        *(s32*)(object + 0x34) -= *(s32*)(object + 0x40) * amount;
    }
}
