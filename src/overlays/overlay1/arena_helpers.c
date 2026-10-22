#include "types.h"

extern u8* volatile D_8006542C;
extern u8** D_80087958;

void* func_8009B0FC(u32 size) {
    u8* result;

    size = (size + 7) & ~7;
    result = D_8006542C;
    D_8006542C = result + size;
    return result;
}

void func_8009B124(u8* wrapper, u16 index) {
    u8** table = D_80087958;
    u8* object = *(u8**)(wrapper + 8);

    *(s32*)(object + 0x64) = *(s32*)(table[index] + 4);
}
