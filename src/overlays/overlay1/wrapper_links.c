#include "types.h"

void func_8009C87C(u8* wrapper, void* value) {
    u8* object = *(u8**)(wrapper + 8);

    *(void**)(object + 0x10) = value;
}

void func_8009C888(u8* destination_wrapper, u8* source_wrapper) {
    u8* destination = *(u8**)(destination_wrapper + 8);
    u8* source = *(u8**)(source_wrapper + 8);

    *(void**)(source + 8) = *(void**)(destination + 8);
}
