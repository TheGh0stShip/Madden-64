#include "types.h"

void* func_800E0124(u8* object) {
    u8* first = *(u8**)(object + 0xC);
    u8* second = *(u8**)(first + 0xC);

    return *(void**)(second + 0xC);
}
