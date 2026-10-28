#include "types.h"

s32 func_800DFB78(u8* object, u8 index) {
    u8* first = *(u8**)(object + 0xC);
    s32* values = *(s32**)(first + 0x74);

    return values[index];
}
