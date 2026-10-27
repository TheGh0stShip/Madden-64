#include "types.h"

extern u8 D_80074A40[];
extern u8 D_80074A50[];
extern u16 transformed_points_outside_count(void*, void*, void*, u16);

u16 func_80043648(void* value) {
    return transformed_points_outside_count(D_80074A50, D_80074A40, value, 0xF13F);
}
