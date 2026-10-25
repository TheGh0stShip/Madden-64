#include "types.h"

extern void func_80034388(void *owner, void *value);
extern void func_80033B20(void *owner, s32 mode);

void object_state_initialize(u8 *owner, u8 *config, void *value, s32 parameter)
{
    register u8 *saved_owner __asm__("$18") = owner;
    register u8 *source __asm__("$3") = config;
    register u8 *state __asm__("$16") = *(u8 **)(saved_owner + 8);
    register u32 saved_parameter __asm__("$17") = parameter;
    register void *argument __asm__("$5") = value;
    register u32 size __asm__("$2");
    register u8 *call_owner __asm__("$4");
    register s32 mode __asm__("$5");

    *(u32 *)(state + 0x18) = *(u32 *)(source + 0x0C);
    *(u32 *)(state + 0x1C) = *(u32 *)(source + 0x14);
    size = *(u32 *)(source + 0x18);
    *(u16 *)(state + 8) = 0;
    *(u16 *)(state + 0x0E) = 0;
    *(u32 *)(state + 4) = 0;
    *(u8 **)(state + 0) = source;
    call_owner = saved_owner;
    __asm__ volatile ("" : : "r" (call_owner) : "memory");
    *(u32 *)(state + 0x20) = size + 4;
    func_80034388(call_owner, argument);
    call_owner = saved_owner;
    __asm__ volatile ("" : "=r" (call_owner) : "0" (call_owner));
    mode = 1;
    __asm__ volatile ("" : : "r" (call_owner), "r" (mode));
    *(u16 *)(state + 0x0A) = saved_parameter;
    func_80033B20(call_owner, mode);
}
