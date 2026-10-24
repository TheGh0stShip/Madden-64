#include "types.h"

extern u8* volatile D_80069294;

u8* func_8001B02C(u32 offset) {
    return (u8*)(*(u32*)((offset & 0xFFFC) + (u32)D_80069294) +
                 (u32)D_80069294);
}
