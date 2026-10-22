#include "types.h"

u8* func_80033298(u8* stream) {
    u16 count = *(u16*)stream;
    u32 offset = *(u16*)(stream + 0xC + count * 2) * *(u16*)(stream + 4);

    *(u16*)stream = count - 1;
    return *(u8**)(stream + 8) + offset;
}
