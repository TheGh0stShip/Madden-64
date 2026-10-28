#include "types.h"

extern void func_80034388(void *owner, void *value);
extern void func_80033B20(void *owner, s32 mode);

void object_state_initialize(u8 *owner, u8 *config, void *value, s32 parameter)
{
    u8 *saved_owner = owner;
    u8 *source = config;
    u8 *state = *(u8 **)(saved_owner + 8);
    u32 saved_parameter = parameter;
    void *argument = value;
    u32 size;
    u8 *call_owner;
    s32 mode;

    *(u32 *)(state + 0x18) = *(u32 *)(source + 0x0C);
    *(u32 *)(state + 0x1C) = *(u32 *)(source + 0x14);
    size = *(u32 *)(source + 0x18);
    *(u16 *)(state + 8) = 0;
    *(u16 *)(state + 0x0E) = 0;
    *(u32 *)(state + 4) = 0;
    *(u8 **)(state + 0) = source;
    call_owner = saved_owner;
    *(u32 *)(state + 0x20) = size + 4;
    func_80034388(call_owner, argument);
    call_owner = saved_owner;
    mode = 1;
    *(u16 *)(state + 0x0A) = saved_parameter;
    func_80033B20(call_owner, mode);
}
