#include "types.h"

extern u32 D_8007A908;
extern u32 D_8007A90C;
extern void func_80044530(u32 handle, u32 first, u32 second, u32 mode,
                         u32 value, u32 alternate);

void grid_pair_dispatch(u32 first, u32 selector, u32 mode, u32 second)
{
    register u32 saved_selector = selector;
    register u32 saved_first = (u16)first;
    register u32 saved_second;
    register u32 saved_mode;
    register u32 offset;
    register u32 call_first;
    u8 value;
    call_first = saved_first;
    saved_second = (u16)second;
    saved_mode = (u8)mode;
    offset = (u16)saved_selector * 44;
    value = (u8)saved_selector;
    func_80044530(*(u32 *)(offset + (u32)&D_8007A908), call_first,
                  saved_second, saved_mode, value, 0);
    func_80044530(*(u32 *)(offset + (u32)&D_8007A90C), saved_first,
                  saved_second, saved_mode, value, 1);
}
