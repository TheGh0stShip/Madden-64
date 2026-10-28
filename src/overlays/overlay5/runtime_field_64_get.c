#include "types.h"

extern u8* D_80072380;

s32 func_800DD634(void) {
    return *(s32*)(D_80072380 + 0x64);
}
