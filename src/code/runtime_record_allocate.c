#include "types.h"

extern void* D_8008AFBC;
extern u8* D_8008773C;
extern void* func_80033174(s32 pool, u16 count, s32 size);
extern u8* func_80033298(void* allocation);

void func_8002FE10(u16 count) {
    void* allocation = func_80033174(0, count, 28);
    u8* record;

    D_8008AFBC = allocation;
    record = func_80033298(allocation);
    D_8008773C = record;
    *(u32*)(record + 0x18) = 0;
    *(s16*)(record + 2) = 0;
}
