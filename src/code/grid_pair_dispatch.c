#include "types.h"

extern u32 D_8007A908;
extern u32 D_8007A90C;
extern void func_80044530(u32 handle, u32 first, u32 second, u32 mode,
                         u32 value, u32 alternate);

void grid_pair_dispatch(u32 first, u32 selector, u32 mode, u32 second)
{
    register u32 saved_selector __asm__("$17") = selector;
    register u32 saved_first __asm__("$18") = (u16)first;
    register u32 saved_second __asm__("$19");
    register u32 saved_mode __asm__("$20");
    register u32 offset __asm__("$16");
    register u32 call_first __asm__("$5");
    u8 value;

    __asm__("" : "=r"(saved_selector), "=r"(saved_first)
            : "0"(saved_selector), "1"(saved_first));
    call_first = saved_first;
    __asm__("" : "=r"(call_first) : "0"(call_first));
    __asm__("" : "=r"(second) : "0"(second), "r"(call_first));
    saved_second = (u16)second;
    saved_mode = (u8)mode;
    __asm__("" : "=r"(saved_second), "=r"(saved_mode)
            : "0"(saved_second), "1"(saved_mode));
    offset = (u16)saved_selector * 44;
    value = (u8)saved_selector;
    func_80044530(*(u32 *)(offset + (u32)&D_8007A908), call_first,
                  saved_second, saved_mode, value, 0);
    func_80044530(*(u32 *)(offset + (u32)&D_8007A90C), saved_first,
                  saved_second, saved_mode, value, 1);
}
