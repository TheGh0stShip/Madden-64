#include "types.h"

extern void func_8000DCF8(u8* node);

void func_8000DCC8(u8* node) {
    u32* child = *(u32**)(node + 8);

    child[0] = child[1] = child[2] = child[3] = 0;
    *(u32*)(node + 0x1C) = *(u32*)(node + 0x20) =
        *(u32*)(node + 0x24) = 0;
    *(void (**)(u8*))(node + 0xC) = func_8000DCF8;
}
