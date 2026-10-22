#include "types.h"

void func_800AA1CC(u8* object) {
    *(u32*)(object + 0xB0) = 0xFD500000;
    *(u32*)(object + 0xB4) = 0x02B00000;
    *(u32*)(object + 0xB8) = 0xFA700000;
    *(u32*)(object + 0xBC) = 0x05900000;
}
