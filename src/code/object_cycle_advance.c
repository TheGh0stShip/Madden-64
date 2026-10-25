#include "types.h"

typedef s32 (*CycleCheck)(void *owner);
typedef void (*CycleDispatch)(void *owner, s32 mode);
extern s32 func_8005848C(void *owner);

s32 object_cycle_advance(u8 *owner)
{
    s32 result;
    register s32 cycle __asm__("$5");
    register s32 state __asm__("$3");
    register s32 cycle_state __asm__("$2");

    if (*(u32 *)(owner + 0x19C) == 0) {
        result = func_8005848C(owner);
        if (result == 0) {
            return result;
        }
    }
    cycle = *(s32 *)(*(u8 **)(owner + 0x1B4) + 0x58);
    state = *(s32 *)(owner + 0x19C);
    cycle_state = cycle + 0xD0;
    if (state == cycle_state) {
            (*(u32 **)owner)[5] = 0x61;
            (*(u32 **)owner)[6] =
                *(u32 *)(*(u8 **)(owner + 0x1B4) + 0x58);
            ((CycleDispatch)(*(u32 **)owner)[1])(owner, 3);
            *(u32 *)(owner + 0x19C) = 0;
    } else {
            u8 *callbacks = *(u8 **)(owner + 0x14);

            result = (*(CycleCheck *)(callbacks + 0x14))(owner);
            if (result == 0) {
                return result;
            }
    }
    *(u32 *)(*(u8 **)(owner + 0x1B4) + 0x58) =
        (*(u32 *)(*(u8 **)(owner + 0x1B4) + 0x58) + 1) & 7;
    return 1;
}
