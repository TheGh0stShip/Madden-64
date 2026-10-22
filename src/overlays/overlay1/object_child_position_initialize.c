#include "types.h"

extern u32 D_80087FB0;
extern u8* D_80087FA0;

void func_800A6400(u8* object) {
    D_80087FB0 = 0;
    *(u32*)(*(u8**)(object + 0x24) + 0x1C) = 0x02000000;
    *(u32*)(*(u8**)(object + 0x24) + 0x20) =
        *(u32*)(*(u8**)(D_80087FA0 + 0x24) + 0x20) - 0x200000;
}
