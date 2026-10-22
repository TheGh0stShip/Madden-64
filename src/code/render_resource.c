#include "types.h"

void func_8000F31C(void) {
}

void func_8000F324(u8* wrapper, void* resource) {
    u8* object = *(u8**)(wrapper + 8);

    *(void**)(object + 0x20) = resource;
}

void func_8000F330(u8* wrapper, u16 flags) {
    u8* object = *(u8**)(wrapper + 8);

    *(u16*)(object + 0xA8) |= flags;
}
