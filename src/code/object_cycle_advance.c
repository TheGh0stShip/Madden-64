#include "types.h"

typedef s32 (*CycleCheck)(void *owner, s32 cycle);
typedef void (*CycleDispatch)(void *owner, s32 mode);
extern s32 func_8005848C(void *owner);

s32 object_cycle_advance(u8 *owner)
{
    s32 result;
    s32 cycle;
    s32 state;

    if (*(u32 *)(owner + 0x19C) == 0) {
        result = func_8005848C(owner);
        if (result == 0) {
            return result;
        }
    }
    cycle = *(s32 *)(*(u8 **)(owner + 0x1B4) + 0x58);
    state = *(s32 *)(owner + 0x19C);
    if (state == cycle + 0xD0) {
        (*(u32 **)owner)[5] = 0x61;
        (*(u32 **)owner)[6] =
            *(u32 *)(*(u8 **)(owner + 0x1B4) + 0x58);
        ((CycleDispatch)(*(u32 **)owner)[1])(owner, 3);
        *(u32 *)(owner + 0x19C) = 0;
    } else {
        u8 *callbacks = *(u8 **)(owner + 0x14);

        result = (*(CycleCheck *)(callbacks + 0x14))(owner, cycle);
        if (result == 0) {
            return result;
        }
    }
    *(u32 *)(*(u8 **)(owner + 0x1B4) + 0x58) =
        (*(u32 *)(*(u8 **)(owner + 0x1B4) + 0x58) + 1) & 7;
    return 1;
}
