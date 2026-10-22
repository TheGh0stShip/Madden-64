#include "types.h"

void func_800174EC(u8* object) {
    u8* resource = *(u8**)(object + 8);
    *(u32*)(resource + 0x30) |= 0x10000;
}
