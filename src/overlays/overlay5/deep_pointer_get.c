#include "types.h"

void* func_800E0170(u8* object) {
    u8* first = *(u8**)(object + 0xC);
    u8* second = *(u8**)(first + 0x6C);
    u8* third = *(u8**)(second + 0xC);

    return *(void**)(third + 0x44);
}
