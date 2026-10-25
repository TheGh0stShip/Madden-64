#include "types.h"

extern u8 *volatile D_80069294;
extern void func_8000BE80(void *owner);
extern void func_8001B410(void *owner, void *state);
extern void func_8001B098(void *owner, void *state);
extern void func_8001B314(void *owner);

void resource_node_configure(u8 *owner, s32 descriptor)
{
    register u8 *saved_owner __asm__("$17") = owner;
    register u32 saved_descriptor __asm__("$18") = descriptor;
    register u8 *state __asm__("$16") = *(u8 **)(saved_owner + 8);
    register u8 *base __asm__("$3");
    register u32 offset __asm__("$2");

    func_8000BE80(saved_owner);
    base = D_80069294;
    offset = saved_descriptor & 0xFFFC;
    offset = offset + (u32)base;
    offset = *(u32 *)offset;
    base = D_80069294;
    offset = offset + (u32)base;
    *(u32 *)(state + 0x10) = offset;
    func_8001B410(saved_owner, state);
    func_8001B098(saved_owner, state);
    *(u16 *)(state + 8) = saved_descriptor;
    func_8001B314(saved_owner);
}
