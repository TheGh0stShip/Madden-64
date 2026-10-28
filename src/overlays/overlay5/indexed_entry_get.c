#include "types.h"

void* func_800E0158(u8* object) {
    u8* table = *(u8**)(object + 8);
    u32 index = table[1];
    u8* entries = *(u8**)(table + 4);

    return entries + index * 8;
}
