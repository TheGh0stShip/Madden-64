#include "types.h"

s32 func_8000D2B0(u8* object) {
    if (*(u16*)(object + 0x206) & 0x400) {
        return 1;
    }
    return 0;
}
