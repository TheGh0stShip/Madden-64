#include "types.h"

extern u16 D_80086190[];
extern void func_8003A8CC(u16 group, u16 *values);

u16 frame_group_value_resolve(u16 frame)
{
    u32 saved_frame = (u16)frame;
    u16 values[55];
    u32 group = saved_frame / 55;
    u16 remainder = saved_frame - group * 55;

    func_8003A8CC(D_80086190[(u16)group], values);
    return values[remainder];
}
