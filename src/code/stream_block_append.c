#include "types.h"

void func_800332C8(u8* stream, u8* position) {
    u32 offset = (u32)(position - *(u8**)(stream + 8)) / *(u16*)(stream + 4);
    u16 count = *(u16*)stream + 1;

    *(u16*)stream = count;
    *(u16*)(stream + 0xC + count * 2) = offset;
}
