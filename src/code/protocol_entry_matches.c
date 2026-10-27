#include "types.h"

extern u16 transformed_points_outside_count(void*, void*, void*, u16);

s32 func_80043610(u8* state, void* value) {
    u8* entry = *(u8**)(state + 0x14);

    return transformed_points_outside_count(entry + 4, entry + 0x10, value, 0xF101) == 8;
}
