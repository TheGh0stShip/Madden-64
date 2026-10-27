#include "types.h"

extern u8 *D_800724DC;
extern u16 func_800349FC(u32 input, s16 *info);
extern void *func_80034F60(u8 value);
extern void func_80034E58(void *resource, s32 active);
extern void func_800344E8(void *owner, void *resource, u32 input, u16 value);

u32 resource_selection_update(u8 *owner, u32 input, u16 value)
{
    s16 info;
    register u8 *saved_owner __asm__("$18") = owner;
    register u32 saved_input __asm__("$20") = input;
    register u16 saved_value __asm__("$21") = value;
    register u8 *state __asm__("$19") = *(u8 **)(owner + 8);
    register u16 result __asm__("$17") = func_800349FC(input, &info);
    register void *resource __asm__("$16");
    register u32 a0_value __asm__("$4");
    register u32 v0_value __asm__("$2");
    register u32 v1_value __asm__("$3");

    a0_value = result & 0xFFFF;
    v0_value = (a0_value ^ 2) < 1;
    v1_value = a0_value < 1;
    v0_value |= v1_value;
    if (v0_value != 0) {
        if (a0_value == 0) {
            resource = func_80034F60(*((u8 *)&info + 1));
            result = 2;
        } else {
            u8 *base = D_800724DC;
            resource = *(void **)(base + info * 20 + 4);
        }
        if (*(void **)state != resource) {
            func_80034E58(*(void **)state, 0);
            func_80034E58(resource, 1);
        }
        func_800344E8(saved_owner, resource, saved_input, saved_value);
    }
    return result;
}
