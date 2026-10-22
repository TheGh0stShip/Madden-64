#include "types.h"

void func_800BDC78(u8* object) {
    if ((*(u32*)(object + 0x14) & 0x40) == 0) {
        *(s32*)(object + 0x24) = 0;
        *(s32*)(object + 0x34) = 0;
    }
}
