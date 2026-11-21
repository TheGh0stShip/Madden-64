#include "types.h"

extern void func_800431BC(void *object, s32 *position, s32 mode);

u8 rectangle_overlap_test(void *object, s16 *rectangle)
{
    s32 position[3];
    s32 *p;
    u16 result;

    func_800431BC(object, position, 1);
    p = position;
    result = p[0] < rectangle[0];
    result |= rectangle[1] < p[0];
    result |= p[1] < rectangle[2];
    result |= rectangle[3] < p[1];
    return result;
}
