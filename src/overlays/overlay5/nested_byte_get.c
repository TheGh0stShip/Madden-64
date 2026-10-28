#include "types.h"

s8 func_800DF76C(u8* object) {
    u8* first = *(u8**)(object + 0xC);
    u8* second = *(u8**)(first + 0xC);

    return *(s8*)(second + 0x10);
}
