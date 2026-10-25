#include "types.h"

typedef void (*ActionMethod)(void *owner);
extern s32 func_8005527C(void *owner);
extern void func_80063318(void *owner);

s32 object_action_update(u8 *owner, s32 dispatch)
{
    register s32 result __asm__("$17");
    register s32 saved_dispatch __asm__("$18") = dispatch;
    s32 return_value;
    u32 type = *(u32 *)(owner + 0x10);

    if (type < 0xC8 || type > 0xC9) {
        (*(u32 **)owner)[5] = 0x12;
        (*(u32 **)owner)[6] = *(u32 *)(owner + 0x10);
        ((ActionMethod)(*(u32 **)owner)[0])(owner);
    }
    result = func_8005527C(owner);
    if (result == 1) {
        goto move_return;
    }
    if (result < 2) {
        return_value = result;
        goto restore;
    }
    if (result != 2) {
        return_value = result;
        goto restore;
    }
    if (saved_dispatch != 0) {
        (*(u32 **)owner)[5] = 0x32;
        ((ActionMethod)(*(u32 **)owner)[0])(owner);
    }
    func_80063318(owner);
move_return:
    return_value = result;
restore:
    return return_value;
}
